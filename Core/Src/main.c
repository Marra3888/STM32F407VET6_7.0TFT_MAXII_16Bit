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
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
RTC_HandleTypeDef hrtc;

SRAM_HandleTypeDef hsram1;

/* USER CODE BEGIN PV */

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

  for (int i = 0; i < 5; i++)
  {
      HAL_GPIO_WritePin(D2_GPIO_Port, D2_Pin, GPIO_PIN_RESET);
      HAL_Delay(100);
      HAL_GPIO_WritePin(D2_GPIO_Port, D2_Pin, GPIO_PIN_SET);
      HAL_Delay(100);
  }
  HAL_Delay(100);

  /* Инициализация */
  MD_Init();
  HAL_Delay(100);

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
	             MD_Clear();
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
  Timing.AddressSetupTime = 5;
  Timing.AddressHoldTime = 2;
  Timing.DataSetupTime = 10;
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
