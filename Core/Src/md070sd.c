/*
 * lcd_ssd1963.c
 *
 *  Created on: Mar 1, 2026
 *      Author: Zver
 */

/*
 * md070sd.c
 * Библиотека для TFT дисплея MD070SD 800x480 с CPLD контроллером
 * STM32F407VET6 + FSMC
 *
 * Примечания:
 * 1. Подсветка при включении = 0 (выключена)
 *    Рекомендуется: очистить экран, затем включить подсветку
 * 2. При записи данных регистр должен быть = 0x0F (DATA_CHANNEL)
 *    Изменение регистра во время записи приведёт к ошибке
 * 3. RST должен быть LOW минимум 1мс, затем HIGH минимум 1мс
 */

#include "md070sd.h"

/* ================================================================
 * Приватные переменные
 * ================================================================ */
static uint8_t currentDisplayPage = 0;
static uint8_t currentWritePage = 0;

/* ================================================================
 * Базовые функции записи
 * ================================================================ */
static void MD_WriteCmd(uint16_t cmd)
{
    LCD_CMD = cmd;
}

static void MD_WriteCmdData(uint16_t cmd, uint16_t data)
{
    LCD_CMD = cmd;
    LCD_DATA = data;
}

/* ================================================================
 * Аппаратный сброс (если RST подключён к GPIO)
 * RST LOW минимум 1мс, затем HIGH минимум 1мс
 * ================================================================ */
#ifdef LCD_RST_Pin
void MD_Reset(void)
{
    HAL_GPIO_WritePin(LCD_RST_GPIO_Port, LCD_RST_Pin, GPIO_PIN_RESET);
    HAL_Delay(2);  /* 2мс LOW */
    HAL_GPIO_WritePin(LCD_RST_GPIO_Port, LCD_RST_Pin, GPIO_PIN_SET);
    HAL_Delay(2);  /* 2мс HIGH для внутренней инициализации */
}
#else
void MD_Reset(void)
{
    /* RST подключён к NRST STM32 — сброс происходит автоматически */
    HAL_Delay(5);  /* Ждём завершения внутренней инициализации */
}
#endif

/* ================================================================
 * Инициализация
 * Рекомендуемая последовательность:
 * 1. Сброс
 * 2. Очистка экрана (подсветка выключена)
 * 3. Включение подсветки
 * ================================================================ */
void MD_Init(void)
{
    /* Сброс */
    MD_Reset();

    /* Настройка режимов */
    MD_SetDisplayPage(0);
    MD_SetWritePage(0);
    MD_SetDisplayMode(DISPLAY_MODE_NORMAL);
    MD_SetAddressDirection(ADDR_DIR_ROW);

    /* Очистка экрана (подсветка ещё выключена — избегаем мерцания) */
    MD_WriteCmd(REG_DATA_CHANNEL);
    MD_Clear();

    /* Включаем подсветку */
    MD_SetBacklight(BACKLIGHT_MAX);
}

/* ================================================================
 * Подсветка (0-16)
 * PWM 300Hz, без мерцания
 * Значения > 16 игнорируются
 * ================================================================ */
void MD_SetBacklight(uint16_t brightness)
{
    if (brightness > BACKLIGHT_MAX) return;  /* Игнорируем значения > 16 */
    MD_WriteCmdData(REG_BACKLIGHT, brightness);
}

void MD_BacklightOn(void)
{
    MD_SetBacklight(BACKLIGHT_MAX);
}

void MD_BacklightOff(void)
{
    MD_SetBacklight(BACKLIGHT_OFF);
}

/* ================================================================
 * Управление страницами
 * ================================================================ */
void MD_SetDisplayPage(uint8_t page)
{
    if (page >= LCD_PAGES) page = 0;
    currentDisplayPage = page;
    MD_WriteCmdData(REG_DISPLAY_PAGE, page);
}

void MD_SetWritePage(uint8_t page)
{
    if (page >= LCD_PAGES) page = 0;
    currentWritePage = page;
    MD_WriteCmdData(REG_WRITE_PAGE, page);
}

void MD_SwapPages(void)
{
    uint8_t temp = currentDisplayPage;
    MD_SetDisplayPage(currentWritePage);
    MD_SetWritePage(temp);
}

uint8_t MD_GetDisplayPage(void)
{
    return currentDisplayPage;
}

uint8_t MD_GetWritePage(void)
{
    return currentWritePage;
}

/* ================================================================
 * Режимы работы
 * ================================================================ */
void MD_Sleep(uint8_t enable)
{
    MD_WriteCmdData(REG_SLEEP, enable ? 0x0001 : 0x0000);
}

void MD_WakeUp(void)
{
    /* Выход из сна — отправить любую команду чтения/записи */
    MD_WriteCmd(REG_DATA_CHANNEL);
}

void MD_SetDisplayMode(uint8_t mode)
{
    MD_WriteCmdData(REG_DISPLAY_MODE, mode);
}

void MD_SetRotation(uint8_t rotation)
{
    switch (rotation)
    {
        case 0:
            MD_SetDisplayMode(DISPLAY_MODE_NORMAL);
            break;
        case 1:
            MD_SetDisplayMode(DISPLAY_MODE_FLIP_LR);
            break;
        case 2:
            MD_SetDisplayMode(DISPLAY_MODE_FLIP_BOTH);
            break;
        case 3:
            MD_SetDisplayMode(DISPLAY_MODE_FLIP_UD);
            break;
        default:
            MD_SetDisplayMode(DISPLAY_MODE_NORMAL);
            break;
    }
}

void MD_SetAddressDirection(uint8_t dir)
{
    MD_WriteCmdData(REG_ADDR_DIR, dir);
}

/* ================================================================
 * Окно вывода
 * Координаты преобразуются в адрес RAM автоматически CPLD
 * ================================================================ */
void MD_SetWindow(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2)
{
    MD_WriteCmdData(REG_ROW_START, y1);
    MD_WriteCmdData(REG_COL_START, x1);
    MD_WriteCmdData(REG_ROW_END, y2);
    MD_WriteCmdData(REG_COL_END, x2);
    MD_WriteCmd(REG_DATA_CHANNEL);  /* Регистр должен быть 0x0F для записи данных */
}

/* ================================================================
 * Очистка и заливка
 * ================================================================ */
void MD_FillScreen(uint16_t color)
{
    MD_SetWindow(0, 0, LCD_WIDTH - 1, LCD_HEIGHT - 1);

    uint32_t total = (uint32_t)LCD_WIDTH * LCD_HEIGHT;
    uint32_t blocks = total / 8;
    uint32_t remainder = total % 8;

    while (blocks--)
    {
        LCD_DATA = color; LCD_DATA = color; LCD_DATA = color; LCD_DATA = color;
        LCD_DATA = color; LCD_DATA = color; LCD_DATA = color; LCD_DATA = color;
    }

    while (remainder--)
    {
        LCD_DATA = color;
    }
}

void MD_Clear(void)
{
    MD_FillScreen(COLOR_BLACK);
}

/* ================================================================
 * Рисование пикселя
 * ================================================================ */
void MD_DrawPixel(uint16_t x, uint16_t y, uint16_t color)
{
    if (x >= LCD_WIDTH || y >= LCD_HEIGHT) return;

    MD_SetWindow(x, y, x, y);
    LCD_DATA = color;
}

/* ================================================================
 * Горизонтальная линия
 * ================================================================ */
void MD_DrawHLine(uint16_t x, uint16_t y, uint16_t len, uint16_t color)
{
    if (x >= LCD_WIDTH || y >= LCD_HEIGHT || len == 0) return;
    if (x + len > LCD_WIDTH) len = LCD_WIDTH - x;

    MD_SetWindow(x, y, x + len - 1, y);

    for (uint16_t i = 0; i < len; i++)
    {
        LCD_DATA = color;
    }
}

/* ================================================================
 * Вертикальная линия
 * ================================================================ */
void MD_DrawVLine(uint16_t x, uint16_t y, uint16_t len, uint16_t color)
{
    if (x >= LCD_WIDTH || y >= LCD_HEIGHT || len == 0) return;
    if (y + len > LCD_HEIGHT) len = LCD_HEIGHT - y;

    MD_SetWindow(x, y, x, y + len - 1);

    for (uint16_t i = 0; i < len; i++)
    {
        LCD_DATA = color;
    }
}

/* ================================================================
 * Линия (алгоритм Брезенхэма)
 * ================================================================ */
void MD_DrawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color)
{
    /* Оптимизация для горизонтальных и вертикальных линий */
    if (y0 == y1)
    {
        if (x0 > x1) { int16_t t = x0; x0 = x1; x1 = t; }
        MD_DrawHLine(x0, y0, x1 - x0 + 1, color);
        return;
    }
    if (x0 == x1)
    {
        if (y0 > y1) { int16_t t = y0; y0 = y1; y1 = t; }
        MD_DrawVLine(x0, y0, y1 - y0 + 1, color);
        return;
    }

    int16_t dx = (x1 > x0) ? (x1 - x0) : (x0 - x1);
    int16_t dy = (y1 > y0) ? (y1 - y0) : (y0 - y1);
    int16_t sx = (x0 < x1) ? 1 : -1;
    int16_t sy = (y0 < y1) ? 1 : -1;
    int16_t err = dx - dy;

    while (1)
    {
        MD_DrawPixel(x0, y0, color);

        if (x0 == x1 && y0 == y1) break;

        int16_t e2 = 2 * err;
        if (e2 > -dy) { err -= dy; x0 += sx; }
        if (e2 < dx)  { err += dx; y0 += sy; }
    }
}

/* ================================================================
 * Прямоугольник (контур)
 * ================================================================ */
void MD_DrawRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color)
{
    if (w == 0 || h == 0) return;

    MD_DrawHLine(x, y, w, color);
    MD_DrawHLine(x, y + h - 1, w, color);
    MD_DrawVLine(x, y, h, color);
    MD_DrawVLine(x + w - 1, y, h, color);
}

/* ================================================================
 * Прямоугольник (заливка)
 * ================================================================ */
void MD_FillRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color)
{
    if (x >= LCD_WIDTH || y >= LCD_HEIGHT || w == 0 || h == 0) return;
    if (x + w > LCD_WIDTH) w = LCD_WIDTH - x;
    if (y + h > LCD_HEIGHT) h = LCD_HEIGHT - y;

    MD_SetWindow(x, y, x + w - 1, y + h - 1);

    uint32_t total = (uint32_t)w * h;
    uint32_t blocks = total / 8;
    uint32_t remainder = total % 8;

    while (blocks--)
    {
        LCD_DATA = color; LCD_DATA = color; LCD_DATA = color; LCD_DATA = color;
        LCD_DATA = color; LCD_DATA = color; LCD_DATA = color; LCD_DATA = color;
    }

    while (remainder--)
    {
        LCD_DATA = color;
    }
}

/* ================================================================
 * Вспомогательные функции для кругов
 * ================================================================ */
static void MD_DrawCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t corner, uint16_t color)
{
    int16_t f = 1 - r;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * r;
    int16_t x = 0;
    int16_t y = r;

    while (x < y)
    {
        if (f >= 0)
        {
            y--;
            ddF_y += 2;
            f += ddF_y;
        }
        x++;
        ddF_x += 2;
        f += ddF_x;

        if (corner & 0x4)
        {
            MD_DrawPixel(x0 + x, y0 + y, color);
            MD_DrawPixel(x0 + y, y0 + x, color);
        }
        if (corner & 0x2)
        {
            MD_DrawPixel(x0 + x, y0 - y, color);
            MD_DrawPixel(x0 + y, y0 - x, color);
        }
        if (corner & 0x8)
        {
            MD_DrawPixel(x0 - y, y0 + x, color);
            MD_DrawPixel(x0 - x, y0 + y, color);
        }
        if (corner & 0x1)
        {
            MD_DrawPixel(x0 - y, y0 - x, color);
            MD_DrawPixel(x0 - x, y0 - y, color);
        }
    }
}

static void MD_FillCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t corner, int16_t delta, uint16_t color)
{
    int16_t f = 1 - r;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * r;
    int16_t x = 0;
    int16_t y = r;

    while (x < y)
    {
        if (f >= 0)
        {
            y--;
            ddF_y += 2;
            f += ddF_y;
        }
        x++;
        ddF_x += 2;
        f += ddF_x;

        if (corner & 0x1)
        {
            MD_DrawVLine(x0 + x, y0 - y, 2 * y + 1 + delta, color);
            MD_DrawVLine(x0 + y, y0 - x, 2 * x + 1 + delta, color);
        }
        if (corner & 0x2)
        {
            MD_DrawVLine(x0 - x, y0 - y, 2 * y + 1 + delta, color);
            MD_DrawVLine(x0 - y, y0 - x, 2 * x + 1 + delta, color);
        }
    }
}

/* ================================================================
 * Круг (контур)
 * ================================================================ */
void MD_DrawCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color)
{
    int16_t x = r;
    int16_t y = 0;
    int16_t err = 0;

    while (x >= y)
    {
        MD_DrawPixel(x0 + x, y0 + y, color);
        MD_DrawPixel(x0 + y, y0 + x, color);
        MD_DrawPixel(x0 - y, y0 + x, color);
        MD_DrawPixel(x0 - x, y0 + y, color);
        MD_DrawPixel(x0 - x, y0 - y, color);
        MD_DrawPixel(x0 - y, y0 - x, color);
        MD_DrawPixel(x0 + y, y0 - x, color);
        MD_DrawPixel(x0 + x, y0 - y, color);

        y++;
        if (err <= 0) err += 2 * y + 1;
        if (err > 0) { x--; err -= 2 * x + 1; }
    }
}

/* ================================================================
 * Круг (заливка)
 * ================================================================ */
void MD_FillCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color)
{
    MD_DrawVLine(x0, y0 - r, 2 * r + 1, color);
    MD_FillCircleHelper(x0, y0, r, 3, 0, color);
}

/* ================================================================
 * Треугольник (контур)
 * ================================================================ */
void MD_DrawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color)
{
    MD_DrawLine(x0, y0, x1, y1, color);
    MD_DrawLine(x1, y1, x2, y2, color);
    MD_DrawLine(x2, y2, x0, y0, color);
}

/* ================================================================
 * Треугольник (заливка)
 * ================================================================ */
void MD_FillTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color)
{
    int16_t a, b, y, last;

    /* Сортируем вершины по Y */
    if (y0 > y1) { int16_t t = y0; y0 = y1; y1 = t; t = x0; x0 = x1; x1 = t; }
    if (y1 > y2) { int16_t t = y1; y1 = y2; y2 = t; t = x1; x1 = x2; x2 = t; }
    if (y0 > y1) { int16_t t = y0; y0 = y1; y1 = t; t = x0; x0 = x1; x1 = t; }

    if (y0 == y2)
    {
        a = b = x0;
        if (x1 < a) a = x1;
        else if (x1 > b) b = x1;
        if (x2 < a) a = x2;
        else if (x2 > b) b = x2;
        MD_DrawHLine(a, y0, b - a + 1, color);
        return;
    }

    int16_t dx01 = x1 - x0, dy01 = y1 - y0;
    int16_t dx02 = x2 - x0, dy02 = y2 - y0;
    int16_t dx12 = x2 - x1, dy12 = y2 - y1;
    int32_t sa = 0, sb = 0;

    if (y1 == y2) last = y1;
    else last = y1 - 1;

    for (y = y0; y <= last; y++)
    {
        a = x0 + sa / dy01;
        b = x0 + sb / dy02;
        sa += dx01;
        sb += dx02;
        if (a > b) { int16_t t = a; a = b; b = t; }
        MD_DrawHLine(a, y, b - a + 1, color);
    }

    sa = dx12 * (y - y1);
    sb = dx02 * (y - y0);
    for (; y <= y2; y++)
    {
        a = x1 + sa / dy12;
        b = x0 + sb / dy02;
        sa += dx12;
        sb += dx02;
        if (a > b) { int16_t t = a; a = b; b = t; }
        MD_DrawHLine(a, y, b - a + 1, color);
    }
}

/* ================================================================
 * Прямоугольник со скруглёнными углами (контур)
 * ================================================================ */
void MD_DrawRoundRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t r, uint16_t color)
{
    if (w == 0 || h == 0) return;
    if (r > w / 2) r = w / 2;
    if (r > h / 2) r = h / 2;

    MD_DrawHLine(x + r, y, w - 2 * r, color);
    MD_DrawHLine(x + r, y + h - 1, w - 2 * r, color);
    MD_DrawVLine(x, y + r, h - 2 * r, color);
    MD_DrawVLine(x + w - 1, y + r, h - 2 * r, color);

    MD_DrawCircleHelper(x + r, y + r, r, 1, color);
    MD_DrawCircleHelper(x + w - r - 1, y + r, r, 2, color);
    MD_DrawCircleHelper(x + w - r - 1, y + h - r - 1, r, 4, color);
    MD_DrawCircleHelper(x + r, y + h - r - 1, r, 8, color);
}

/* ================================================================
 * Прямоугольник со скруглёнными углами (заливка)
 * ================================================================ */
void MD_FillRoundRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t r, uint16_t color)
{
    if (w == 0 || h == 0) return;
    if (r > w / 2) r = w / 2;
    if (r > h / 2) r = h / 2;

    MD_FillRect(x + r, y, w - 2 * r, h, color);

    MD_FillCircleHelper(x + w - r - 1, y + r, r, 1, h - 2 * r - 1, color);
    MD_FillCircleHelper(x + r, y + r, r, 2, h - 2 * r - 1, color);
}

/* ================================================================
 * Чтение пикселя
 * ================================================================ */
uint16_t MD_ReadPixel(uint16_t x, uint16_t y)
{
    if (x >= LCD_WIDTH || y >= LCD_HEIGHT) return 0;

    MD_SetWindow(x, y, x, y);

    LCD_CMD = REG_READ_DATA;

    uint16_t color = LCD_DATA;

    return color;
}

/* ================================================================
 * Чтение области в буфер
 * ================================================================ */
void MD_ReadRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t *buffer)
{
    if (x >= LCD_WIDTH || y >= LCD_HEIGHT) return;
    if (x + w > LCD_WIDTH) w = LCD_WIDTH - x;
    if (y + h > LCD_HEIGHT) h = LCD_HEIGHT - y;
    if (buffer == NULL) return;

    MD_SetWindow(x, y, x + w - 1, y + h - 1);

    LCD_CMD = REG_READ_DATA;

    uint32_t total = (uint32_t)w * h;
    for (uint32_t i = 0; i < total; i++)
    {
        buffer[i] = LCD_DATA;
    }
}

/* ================================================================
 * Копирование области экрана
 * ================================================================ */
void MD_CopyRect(uint16_t srcX, uint16_t srcY, uint16_t dstX, uint16_t dstY, uint16_t w, uint16_t h)
{
    if (w == 0 || h == 0) return;
    if (srcX >= LCD_WIDTH || srcY >= LCD_HEIGHT) return;
    if (dstX >= LCD_WIDTH || dstY >= LCD_HEIGHT) return;

    /* Ограничиваем размеры */
    if (srcX + w > LCD_WIDTH) w = LCD_WIDTH - srcX;
    if (srcY + h > LCD_HEIGHT) h = LCD_HEIGHT - srcY;
    if (dstX + w > LCD_WIDTH) w = LCD_WIDTH - dstX;
    if (dstY + h > LCD_HEIGHT) h = LCD_HEIGHT - dstY;

    /* Читаем построчно и записываем */
    uint16_t lineBuffer[LCD_WIDTH];

    for (uint16_t row = 0; row < h; row++)
    {
        /* Читаем строку */
        MD_SetWindow(srcX, srcY + row, srcX + w - 1, srcY + row);
        LCD_CMD = REG_READ_DATA;

        for (uint16_t i = 0; i < w; i++)
        {
            lineBuffer[i] = LCD_DATA;
        }

        /* Записываем строку */
        MD_SetWindow(dstX, dstY + row, dstX + w - 1, dstY + row);
        for (uint16_t i = 0; i < w; i++)
        {
            LCD_DATA = lineBuffer[i];
        }
    }
}
