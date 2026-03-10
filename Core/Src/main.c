/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/

#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <md070sd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "lvgl.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
#define BACKGROUND	COLOR_LIME
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define DRAW_BUF_SIZE (LCD_WIDTH * 40)
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
RTC_HandleTypeDef hrtc;
SRAM_HandleTypeDef hsram1;

/* USER CODE BEGIN PV */
RTC_TimeTypeDef sTime;
RTC_DateTypeDef sDate;
char timeStr[16];   /* "HH:MM:SS" с запасом */
char dateStr[16];   /* "DD.MM.YYYY" с запасом */
// Глобальные объекты UI для обновления в цикле
lv_obj_t * ui_LabelTime; // Только ЧЧ:ММ
lv_obj_t * ui_LabelSec;  // Только :СС
lv_obj_t * ui_LabelDate;

// Буфер для LVGL
static uint16_t draw_buf[DRAW_BUF_SIZE];

// Ссылка на шрифт
extern lv_font_t MyFont;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_FSMC_Init(void);
static void MX_RTC_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
void LED_BlinkNumber(GPIO_TypeDef* port, uint16_t pin, uint8_t count)
{
    for (uint8_t i = 0; i < count; i++)
    {
        HAL_GPIO_WritePin(port, pin, GPIO_PIN_RESET);
        HAL_Delay(300);
        HAL_GPIO_WritePin(port, pin, GPIO_PIN_SET);
        HAL_Delay(300);
    }
    HAL_Delay(500);
}

/*
 * Функция устанавливает время RTC, равное времени компиляции прошивки.
 * Формат __DATE__: "Mmm DD YYYY" (например "Mar 02 2026")
 * Формат __TIME__: "HH:MM:SS" (например "18:30:00")
 */
void RTC_SetToCompileTime(void)
{
    RTC_TimeTypeDef sTime = {0};
    RTC_DateTypeDef sDate = {0};
    const char *dateStr = __DATE__;
    const char *timeStr = __TIME__;

    // --- Парсим ВРЕМЯ ---
    // __TIME__ формат "HH:MM:SS"
    sTime.Hours   = (timeStr[0] - '0') * 10 + (timeStr[1] - '0');
    sTime.Minutes = (timeStr[3] - '0') * 10 + (timeStr[4] - '0');
    sTime.Seconds = (timeStr[6] - '0') * 10 + (timeStr[7] - '0');
    sTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
    sTime.StoreOperation = RTC_STOREOPERATION_RESET;

    // --- Парсим ДАТУ ---
    // __DATE__ формат "Mmm DD YYYY"

    // Год (берем последние 2 цифры, предполагая 21 век)
    sDate.Year = (dateStr[9] - '0') * 10 + (dateStr[10] - '0');

    // День (может быть пробел, если день < 10, например "Mar  2 2026")
    if (dateStr[4] == ' ') {
        sDate.Date = dateStr[5] - '0';
    } else {
        sDate.Date = (dateStr[4] - '0') * 10 + (dateStr[5] - '0');
    }

    // Месяц (сравниваем текст)
    const char *months = "JanFebMarAprMayJunJulAugSepOctNovDec";
    char currentMonth[4];
    strncpy(currentMonth, dateStr, 3);
    currentMonth[3] = '\0';

    for (int i = 0; i < 12; i++) {
        if (strncmp(currentMonth, &months[i * 3], 3) == 0) {
            sDate.Month = i + 1;
            break;
        }
    }

    // Установка в RTC
    HAL_RTC_SetTime(&hrtc, &sTime, RTC_FORMAT_BIN);
    HAL_RTC_SetDate(&hrtc, &sDate, RTC_FORMAT_BIN);

    // Записываем флаг в Backup регистр
    HAL_RTCEx_BKUPWrite(&hrtc, RTC_BKP_DR0, 0xA5A5);
}

/*
 * Функция сброса буфера на дисплей (Flush Callback)
 * Это "мост" между LVGL и вашим драйвером md070sd
 */
void my_disp_flush(lv_display_t * disp, const lv_area_t * area, uint8_t * px_map)
{
    // 1. Устанавливаем окно записи на дисплее
    MD_SetWindow(area->x1, area->y1, area->x2, area->y2);

    // 2. Вычисляем количество пикселей
    uint32_t count = (area->x2 - area->x1 + 1) * (area->y2 - area->y1 + 1);
    uint16_t * color_p = (uint16_t *)px_map;

    // 3. Отправляем данные потоком (максимально быстро)
    // Используем прямой доступ к адресу LCD_DATA для скорости
    volatile uint16_t * lcd_ram = (volatile uint16_t *)0x60080000; // Адрес данных FSMC

    while (count > 0) {
        *lcd_ram = *color_p++;
        count--;
    }

    // 4. Сообщаем LVGL, что мы закончили
    lv_display_flush_ready(disp);
}

/*
 * Создание интерфейса
 */
void CreateUI(void)
{
    lv_obj_t * scr = lv_screen_active();
    lv_obj_set_style_bg_color(scr, lv_color_hex(0x000000), 0);

    // --- Стиль текста (Общий) ---
    static lv_style_t style_text;
    lv_style_init(&style_text);
    lv_style_set_text_font(&style_text, &MyFont); // Orbitron 100px
    lv_style_set_text_color(&style_text, lv_color_hex(0x00FFFF)); // Cyan

    // --- 1. Основное время (ЧАСЫ : МИНУТЫ :) ---
    ui_LabelTime = lv_label_create(scr);
    lv_obj_add_style(ui_LabelTime, &style_text, 0);

    // ТЕПЕРЬ ДВОЕТОЧИЕ ЗДЕСЬ В КОНЦЕ
    lv_label_set_text(ui_LabelTime, "00:00:");

    // СМЕЩЕНИЕ:
    // X = -80: Сдвигаем еще левее, так как строка стала шире на одно двоеточие.
    // Y = -60: Оставляем как было.
    lv_obj_align(ui_LabelTime, LV_ALIGN_CENTER, -80, -60);

    // --- 2. Секунды (СС) ---
    ui_LabelSec = lv_label_create(scr);
    lv_obj_add_style(ui_LabelSec, &style_text, 0);

    // Цвет секунд (Серый)
    lv_obj_set_style_text_color(ui_LabelSec, lv_color_hex(COLOR_GRAY_7), 0); // Светло-серый

    // ТЕПЕРЬ ЗДЕСЬ ТОЛЬКО ЦИФРЫ
    lv_label_set_text(ui_LabelSec, "00");

    // ПРИВЯЗКА:
    // Крепим к правому краю часов.
    // X = 0: Двоеточие уже есть в часах, поэтому отступ можно сделать минимальным или 0.
    lv_obj_align_to(ui_LabelSec, ui_LabelTime, LV_ALIGN_OUT_RIGHT_BOTTOM, 0, 0);

    // --- 3. Дата ---
    ui_LabelDate = lv_label_create(scr);
    lv_obj_add_style(ui_LabelDate, &style_text, 0);
    lv_obj_set_style_text_color(ui_LabelDate, lv_color_hex(0xFFFF00), 0); // Yellow
    lv_label_set_text(ui_LabelDate, "01/01/2026");

    // СМЕЩЕНИЕ ДАТЫ:
    lv_obj_align(ui_LabelDate, LV_ALIGN_CENTER, 0, 70);

    // Если дата 100px не влезает, можно уменьшить масштаб (опционально)
    // lv_obj_set_style_transform_scale(ui_LabelDate, 128, 0);
}

/*
 * Обновление данных времени
 */
void UpdateTimeUI(void)
{
    RTC_TimeTypeDef sTime;
    RTC_DateTypeDef sDate;

    HAL_RTC_GetTime(&hrtc, &sTime, RTC_FORMAT_BIN);
    HAL_RTC_GetDate(&hrtc, &sDate, RTC_FORMAT_BIN);

    // ВНИМАНИЕ: Двоеточие в конце формата времени!
    lv_label_set_text_fmt(ui_LabelTime, "%02d:%02d:", sTime.Hours, sTime.Minutes);

    // ВНИМАНИЕ: Здесь только цифры!
    lv_label_set_text_fmt(ui_LabelSec, "%02d", sTime.Seconds);

    // Дата без изменений
    lv_label_set_text_fmt(ui_LabelDate, "%02d/%02d/20%02d", sDate.Date, sDate.Month, sDate.Year);
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_FSMC_Init();
  MX_RTC_Init();
  /* USER CODE BEGIN 2 */

//							  for (int i = 0; i < 5; i++)
//							  {
//								  HAL_GPIO_WritePin(D2_GPIO_Port, D2_Pin, GPIO_PIN_RESET);
//								  HAL_Delay(100);
//								  HAL_GPIO_WritePin(D2_GPIO_Port, D2_Pin, GPIO_PIN_SET);
//								  HAL_Delay(100);
//							  }
//							  HAL_Delay(100);
//
//							  /* Инициализация */
//							  MD_Init();
//							  HAL_Delay(100);


  	  /* Инициализация дисплея */
      MD_Init();
//      MD_FillScreen(BACKGROUND);

      //Инициализация ядра LVGL
        lv_init();

        // 3. Регистрация дисплея в LVGL
          lv_display_t * disp = lv_display_create(LCD_WIDTH, LCD_HEIGHT);
          lv_display_set_flush_cb(disp, my_disp_flush); // Назначаем нашу функцию отрисовки

          // Назначаем буфер. Partial mode означает, что LVGL рисует частями.
          lv_display_set_buffers(disp, draw_buf, NULL, sizeof(draw_buf), LV_DISPLAY_RENDER_MODE_PARTIAL);

          // 4. Создаем виджеты
          CreateUI();

          if (HAL_RTCEx_BKUPRead(&hrtc, RTC_BKP_DR0) != 0xA5A5)
            {
                RTC_SetToCompileTime(); // <--- Устанавливаем время сборки
            }

          /*
             * ВАРИАНТ Б (ДЛЯ ОТЛАДКИ):
             * Раскомментируйте строку ниже, прошейте один раз.
             * Часы установятся на время компиляции.
             * После этого закомментируйте обратно, чтобы при перезагрузке (Reset)
             * время не отскакивало назад в прошлое.
             */
//             RTC_SetToCompileTime();

          uint32_t last_time_update = 0;
      /* Установка времени (если нужно) */
      /* Раскомментируй и установи текущее время при первом запуске */
//       RTC_SetTime(12, 30, 0);        /* 12:30:00 */
//       RTC_SetDate(15, 6, 25, 7);     /* 15 июня 2025, воскресенье */
       while (1)
       {
       /* Отображаем время */
//              DisplayTime();
//              DisplayTimeFancy();
//              DisplayDateTime();

    	   // 1. Менеджер задач LVGL (рисование, анимации, таймеры)
    	         // Должен вызываться каждые несколько мс
    	         lv_timer_handler();

    	         // 2. Обновление времени раз в 249мс
    	         if (HAL_GetTick() - last_time_update > 249) {
    	             UpdateTimeUI();
    	             // Мигаем светодиодом для индикации работы
    	             HAL_GPIO_TogglePin(D2_GPIO_Port, D2_Pin);
    	             last_time_update = HAL_GetTick();
    	         }

              /* Задержка 100 мс для плавного обновления */
//              HAL_Delay(100);
       }
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
	  /* Тест 1: Все цвета */
	     LED_BlinkNumber(D2_GPIO_Port, D2_Pin, 1);
	     MD_FillScreen(COLOR_RED);
	     HAL_Delay(1000);
	     MD_FillScreen(COLOR_GREEN);
	     HAL_Delay(1000);
	     MD_FillScreen(COLOR_BLUE);
	     HAL_Delay(1000);
	     MD_FillScreen(COLOR_WHITE);
	     HAL_Delay(1000);
	     	 	 MD_FillScreen(COLOR_YELLOW);
	     	     HAL_Delay(1000);
	     	     MD_FillScreen(COLOR_ORANGE);
	     	     HAL_Delay(1000);
	     	     MD_FillScreen(COLOR_CYAN);
	     	     HAL_Delay(1000);
	     	     MD_FillScreen(COLOR_MAGENTA);
	     	     HAL_Delay(1000);
	     	     	 	 MD_FillScreen(COLOR_PINK);
	     	    	     HAL_Delay(1000);
	     	    	     MD_FillScreen(COLOR_BROWN);
	     	    	     HAL_Delay(1000);
	     	    	     MD_FillScreen(COLOR_SILVER);
	     	    	     HAL_Delay(1000);
	     	    	     MD_FillScreen(COLOR_GRAY);
	     	    	     HAL_Delay(1000);
	     	    	     	 	 MD_FillScreen(COLOR_MAROON);
	     	    	    	     HAL_Delay(1000);
	     	    	    	     MD_FillScreen(COLOR_OLIVE);
	     	    	    	     HAL_Delay(1000);
	     	    	    	     MD_FillScreen(COLOR_LIME);
	     	    	    	     HAL_Delay(1000);
	     	    	    	     MD_FillScreen(COLOR_AQUA);
	     	    	    	     HAL_Delay(1000);
	     	    	    	     	 	 MD_FillScreen(COLOR_TEAL);
	     	    	    	    	     HAL_Delay(1000);
	     	    	    	    	     MD_FillScreen(COLOR_NAVY);
	     	    	    	    	     HAL_Delay(1000);
	     	    	    	    	     MD_FillScreen(COLOR_FUCHSIA);
	     	    	    	    	     HAL_Delay(1000);
	     	    	    	    	     MD_FillScreen(COLOR_PURPLE);
	     	    	    	    	     HAL_Delay(1000);

	     /* Тест 2: Рамка по краю экрана */
	     LED_BlinkNumber(D2_GPIO_Port, D2_Pin, 2);
	     MD_FillScreen(COLOR_BLACK);
	     MD_DrawRect(0, 0, 799, 480, COLOR_WHITE);
	     HAL_Delay(3000);

	     /* Тест 3: Несколько рамок */
	     LED_BlinkNumber(D2_GPIO_Port, D2_Pin, 3);
	     MD_FillScreen(COLOR_BLACK);
	     MD_DrawRect(0, 0, 799, 480, COLOR_RED);
	     MD_DrawRect(50, 50, 700, 380, COLOR_GREEN);
	     MD_DrawRect(100, 100, 600, 280, COLOR_BLUE);
	     HAL_Delay(3000);

	     /* Тест 4: Прямоугольники */
	     LED_BlinkNumber(D2_GPIO_Port, D2_Pin, 4);
	     MD_FillScreen(COLOR_BLACK);
	     MD_FillRect(50, 50, 200, 150, COLOR_RED);
	     MD_FillRect(300, 150, 200, 200, COLOR_GREEN);
	     MD_FillRect(550, 100, 200, 300, COLOR_BLUE);
	     HAL_Delay(3000);

	     /* Тест 5: Крест */
	     LED_BlinkNumber(D2_GPIO_Port, D2_Pin, 5);
	     MD_FillScreen(COLOR_BLACK);
	     MD_FillRect(0, 235, 800, 10, COLOR_WHITE);
	     MD_FillRect(395, 0, 10, 480, COLOR_WHITE);
	     HAL_Delay(3000);

	     /* Тест 6: Градиент яркости */
	     LED_BlinkNumber(D2_GPIO_Port, D2_Pin, 6);
	     MD_FillScreen(COLOR_BLUE);
	     for (int br = 16; br >= 0; br--)
	     {
	         MD_SetBacklight(br);
	         HAL_Delay(100);
	     }
	     for (int br = 0; br <= 16; br++)
	     {
	         MD_SetBacklight(br);
	         HAL_Delay(100);
	     }
	     HAL_Delay(1000);

	     /* Тест 7: Все цвета палитры */
	     LED_BlinkNumber(D2_GPIO_Port, D2_Pin, 7);
	     MD_FillScreen(COLOR_BLACK);
	     MD_FillRect(0, 0, 100, 120, COLOR_RED);
	     MD_FillRect(100, 0, 100, 120, COLOR_GREEN);
	     MD_FillRect(200, 0, 100, 120, COLOR_BLUE);
	     MD_FillRect(300, 0, 100, 120, COLOR_YELLOW);
	     MD_FillRect(400, 0, 100, 120, COLOR_CYAN);
	     MD_FillRect(500, 0, 100, 120, COLOR_MAGENTA);
	     MD_FillRect(600, 0, 100, 120, COLOR_WHITE);
	     MD_FillRect(700, 0, 100, 120, COLOR_SILVER);

	     MD_FillRect(0, 120, 100, 120, COLOR_GRAY);
	     MD_FillRect(100, 120, 100, 120, COLOR_MAROON);
	     MD_FillRect(200, 120, 100, 120, COLOR_OLIVE);
	     MD_FillRect(300, 120, 100, 120, COLOR_LIME);
	     MD_FillRect(400, 120, 100, 120, COLOR_AQUA);
	     MD_FillRect(500, 120, 100, 120, COLOR_TEAL);
	     MD_FillRect(600, 120, 100, 120, COLOR_NAVY);
	     MD_FillRect(700, 120, 100, 120, COLOR_PURPLE);

	     MD_FillRect(0, 240, 100, 120, COLOR_FUCHSIA);
	     MD_FillRect(100, 240, 100, 120, COLOR_ORANGE);
	     HAL_Delay(5000);

	     /* Демо геометрии */
	             MD_Clear(BACKGROUND);
	             MD_FillRect(50, 50, 200, 150, COLOR_RED);
	             MD_DrawRect(50, 50, 200, 150, COLOR_WHITE);
	             MD_FillCircle(500, 240, 100, COLOR_GREEN);
	             MD_DrawCircle(500, 240, 100, COLOR_WHITE);
	             MD_FillTriangle(650, 50, 750, 200, 600, 200, COLOR_BLUE);
	             MD_FillRoundRect(100, 300, 200, 100, 20, COLOR_YELLOW);
	             MD_DrawLine(0, 0, 799, 479, COLOR_WHITE);
	             HAL_Delay(3000);

	             /* Демо двойной буферизации */
	                     MD_SetDisplayPage(0);
	                     MD_SetWritePage(1);
	                     MD_FillScreen(COLOR_CYAN);
	                     MD_FillCircle(400, 240, 150, COLOR_RED);
	                     MD_SwapPages();  /* Мгновенное переключение */
	                     HAL_Delay(1000);

	                     /* Демо режима сна */
	                     MD_SetDisplayPage(0);
	                     MD_SetWritePage(0);
	                             MD_Sleep(1);
	                             HAL_Delay(2000);
	                             MD_WakeUp();
	                             HAL_Delay(1000);



    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI|RCC_OSCILLATORTYPE_LSE;
  RCC_OscInitStruct.LSEState = RCC_LSE_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 64;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief RTC Initialization Function
  * @param None
  * @retval None
  */
static void MX_RTC_Init(void)
{

  /* USER CODE BEGIN RTC_Init 0 */

  /* USER CODE END RTC_Init 0 */

  RTC_TimeTypeDef sTime = {0};
  RTC_DateTypeDef sDate = {0};

  /* USER CODE BEGIN RTC_Init 1 */

  /* USER CODE END RTC_Init 1 */

  /** Initialize RTC Only
  */
  hrtc.Instance = RTC;
  hrtc.Init.HourFormat = RTC_HOURFORMAT_24;
  hrtc.Init.AsynchPrediv = 127;
  hrtc.Init.SynchPrediv = 255;
  hrtc.Init.OutPut = RTC_OUTPUT_DISABLE;
  hrtc.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
  hrtc.Init.OutPutType = RTC_OUTPUT_TYPE_OPENDRAIN;
  if (HAL_RTC_Init(&hrtc) != HAL_OK)
  {
    Error_Handler();
  }

  /* USER CODE BEGIN Check_RTC_BKUP */
  HAL_PWR_EnableBkUpAccess();

    // Если RTC уже был настроен и backup domain жив (VBAT есть),
    // то НЕ выполняем нижний SetTime/SetDate (иначе сброс на 00:00:00)
    if (HAL_RTCEx_BKUPRead(&hrtc, RTC_BKP_DR0) == 0xA5A5)
    {
      return;
    }
  /* USER CODE END Check_RTC_BKUP */

  /** Initialize RTC and set the Time and Date
  */
  sTime.Hours = 0x0;
  sTime.Minutes = 0x0;
  sTime.Seconds = 0x0;
  sTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  sTime.StoreOperation = RTC_STOREOPERATION_RESET;
  if (HAL_RTC_SetTime(&hrtc, &sTime, RTC_FORMAT_BCD) != HAL_OK)
  {
    Error_Handler();
  }
  sDate.WeekDay = RTC_WEEKDAY_MONDAY;
  sDate.Month = RTC_MONTH_JANUARY;
  sDate.Date = 0x1;
  sDate.Year = 0x0;

  if (HAL_RTC_SetDate(&hrtc, &sDate, RTC_FORMAT_BCD) != HAL_OK)
  {
    Error_Handler();
  }

  /** Enable Calibrartion
  */
  if (HAL_RTCEx_SetCalibrationOutPut(&hrtc, RTC_CALIBOUTPUT_1HZ) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN RTC_Init 2 */
  HAL_RTCEx_BKUPWrite(&hrtc, RTC_BKP_DR0, 0xA5A5);
  /* USER CODE END RTC_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /* USER CODE BEGIN MX_GPIO_Init_1 */

  /* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, D2_Pin|D3_Pin, GPIO_PIN_SET);

  /*Configure GPIO pins : D2_Pin D3_Pin */
  GPIO_InitStruct.Pin = D2_Pin|D3_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /* USER CODE BEGIN MX_GPIO_Init_2 */

  /* USER CODE END MX_GPIO_Init_2 */
}

/* FSMC initialization function */
static void MX_FSMC_Init(void)
{

  /* USER CODE BEGIN FSMC_Init 0 */

  /* USER CODE END FSMC_Init 0 */

  FSMC_NORSRAM_TimingTypeDef Timing = {0};

  /* USER CODE BEGIN FSMC_Init 1 */

  /* USER CODE END FSMC_Init 1 */

  /** Perform the SRAM1 memory initialization sequence
  */
  hsram1.Instance = FSMC_NORSRAM_DEVICE;
  hsram1.Extended = FSMC_NORSRAM_EXTENDED_DEVICE;
  /* hsram1.Init */
  hsram1.Init.NSBank = FSMC_NORSRAM_BANK1;
  hsram1.Init.DataAddressMux = FSMC_DATA_ADDRESS_MUX_DISABLE;
  hsram1.Init.MemoryType = FSMC_MEMORY_TYPE_SRAM;
  hsram1.Init.MemoryDataWidth = FSMC_NORSRAM_MEM_BUS_WIDTH_16;
  hsram1.Init.BurstAccessMode = FSMC_BURST_ACCESS_MODE_DISABLE;
  hsram1.Init.WaitSignalPolarity = FSMC_WAIT_SIGNAL_POLARITY_LOW;
  hsram1.Init.WrapMode = FSMC_WRAP_MODE_DISABLE;
  hsram1.Init.WaitSignalActive = FSMC_WAIT_TIMING_BEFORE_WS;
  hsram1.Init.WriteOperation = FSMC_WRITE_OPERATION_ENABLE;
  hsram1.Init.WaitSignal = FSMC_WAIT_SIGNAL_DISABLE;
  hsram1.Init.ExtendedMode = FSMC_EXTENDED_MODE_DISABLE;
  hsram1.Init.AsynchronousWait = FSMC_ASYNCHRONOUS_WAIT_DISABLE;
  hsram1.Init.WriteBurst = FSMC_WRITE_BURST_DISABLE;
  hsram1.Init.PageSize = FSMC_PAGE_SIZE_NONE;
  /* Timing */
  Timing.AddressSetupTime = 10;
  Timing.AddressHoldTime = 2;
  Timing.DataSetupTime = 15;
  Timing.BusTurnAroundDuration = 1;
  Timing.CLKDivision = 2;
  Timing.DataLatency = 2;
  Timing.AccessMode = FSMC_ACCESS_MODE_A;
  /* ExtTiming */

  if (HAL_SRAM_Init(&hsram1, &Timing, NULL) != HAL_OK)
  {
    Error_Handler( );
  }

  /* USER CODE BEGIN FSMC_Init 2 */

  /* USER CODE END FSMC_Init 2 */
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
