/*
 * md070sd_final.c
 *
 *  Created on: Mar 1, 2026
 *      Author: Zver
 */

/*
 * md070sd.c
 * Библиотека для TFT дисплея MD070SD 800x480 с CPLD контроллером
 * STM32F407VET6 + FSMC
 *
 * На основе официального демо-кода MD070SD (8051)
 */

#include "md070sd.h"

/* ================================================================
 * Приватные переменные
 * ================================================================ */
static uint8_t currentDisplayPage = 0;
static uint8_t currentWritePage = 0;

/* ================================================================
 * Низкоуровневые функции (как в демо-коде)
 * ================================================================ */

void LCD_WR_REG(uint16_t reg)
{
    LCD_CMD = reg;
}

void LCD_WR_DATA(uint16_t data)
{
    LCD_DATA = data;
}

void LCD_WR_DATA8(uint8_t VH, uint8_t VL)
{
    LCD_DATA = ((uint16_t)VH << 8) | VL;
}

/* ================================================================
 * Установка адреса (как в демо-коде)
 * ================================================================ */
void Address_set(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2)
{
    LCD_WR_REG(REG_BEGIN_Y);    /* 0x02 - begin y */
    LCD_WR_DATA(y1);
    LCD_WR_REG(REG_BEGIN_X);    /* 0x03 - begin x */
    LCD_WR_DATA(x1);
    LCD_WR_REG(REG_STOP_Y);     /* 0x06 - stop y */
    LCD_WR_DATA(y2);
    LCD_WR_REG(REG_STOP_X);     /* 0x07 - stop x */
    LCD_WR_DATA(x2);
    LCD_WR_REG(REG_DATA_CHANNEL); /* 0x0F */
}

/* ================================================================
 * Аппаратный сброс
 * RST LOW минимум 1мс, затем HIGH минимум 1мс
 * ================================================================ */
#ifdef LCD_RST_Pin
void MD_Reset(void)
{
    HAL_GPIO_WritePin(LCD_RST_GPIO_Port, LCD_RST_Pin, GPIO_PIN_RESET);
    HAL_Delay(2);
    HAL_GPIO_WritePin(LCD_RST_GPIO_Port, LCD_RST_Pin, GPIO_PIN_SET);
    HAL_Delay(2);
}
#else
void MD_Reset(void)
{
    /* RST подключён к NRST STM32 */
    HAL_Delay(5);
}
#endif

/* ================================================================
 * Инициализация (как в демо-коде)
 * ================================================================ */
void MD_Init(void)
{
    /* Сброс */
    MD_Reset();

    /* Включить подсветку */
    LCD_WR_REG(REG_BACKLIGHT);  /* 0x01 */
    LCD_WR_DATA(BACKLIGHT_MAX); /* 16 */

    /* Страницы по умолчанию = 0 */
    currentDisplayPage = 0;
    currentWritePage = 0;
}

/* ================================================================
 * Подсветка
 * ================================================================ */
void MD_SetBacklight(uint16_t brightness)
{
    if (brightness > BACKLIGHT_MAX) return;
    LCD_WR_REG(REG_BACKLIGHT);
    LCD_WR_DATA(brightness);
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
 * Управление страницами (как в демо-коде)
 * ================================================================ */

/* Установить текущую страницу записи */
void WritePage(uint8_t index)
{
    if (index >= LCD_PAGES) index = 0;
    currentWritePage = index;
    LCD_WR_REG(REG_WRITE_PAGE);  /* 0x05 */
    LCD_WR_DATA(index);
}

/* Установить текущую страницу отображения */
void ShowPage(uint8_t index)
{
    if (index >= LCD_PAGES) index = 0;
    currentDisplayPage = index;
    LCD_WR_REG(REG_DISPLAY_PAGE);  /* 0x04 */
    LCD_WR_DATA(index);
}

void MD_SwapPages(void)
{
    uint8_t temp = currentDisplayPage;
    ShowPage(currentWritePage);
    WritePage(temp);
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
 * Режимы
 * ================================================================ */
void MD_Sleep(uint8_t enable)
{
    LCD_WR_REG(REG_SLEEP);
    LCD_WR_DATA(enable ? 0x01 : 0x00);
}

void MD_WakeUp(void)
{
    LCD_WR_REG(REG_DATA_CHANNEL);
}

void MD_SetDisplayMode(uint8_t mode)
{
    LCD_WR_REG(REG_DISPLAY_MODE);
    LCD_WR_DATA(mode);
}

void MD_SetRotation(uint8_t rotation)
{
    switch (rotation)
    {
        case 0: MD_SetDisplayMode(DISPLAY_MODE_NORMAL); break;
        case 1: MD_SetDisplayMode(DISPLAY_MODE_FLIP_LR); break;
        case 2: MD_SetDisplayMode(DISPLAY_MODE_FLIP_BOTH); break;
        case 3: MD_SetDisplayMode(DISPLAY_MODE_FLIP_UD); break;
        default: MD_SetDisplayMode(DISPLAY_MODE_NORMAL); break;
    }
}

void MD_SetAddressDirection(uint8_t dir)
{
    LCD_WR_REG(REG_ADDR_DIR);
    LCD_WR_DATA(dir);
}

/* ================================================================
 * Очистка экрана (как в демо-коде)
 * ================================================================ */
void LCD_Clear(uint16_t color)
{
    uint8_t VH = color >> 8;
    uint8_t VL = color & 0xFF;

    Address_set(0, 0, LCD_W - 1, LCD_H - 1);

    for (uint16_t i = 0; i < LCD_W; i++)
    {
        for (uint16_t j = 0; j < LCD_H; j++)
        {
            LCD_WR_DATA8(VH, VL);
        }
    }
}

/* Оптимизированная версия */
void MD_FillScreen(uint16_t color)
{
    Address_set(0, 0, LCD_W - 1, LCD_H - 1);

    uint32_t total = (uint32_t)LCD_W * LCD_H;
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
 * Рисование пикселя
 * ================================================================ */
void MD_DrawPixel(uint16_t x, uint16_t y, uint16_t color)
{
    if (x >= LCD_W || y >= LCD_H) return;

    Address_set(x, y, x, y);
    LCD_DATA = color;
}

/* ================================================================
 * Линии
 * ================================================================ */
void MD_DrawHLine(uint16_t x, uint16_t y, uint16_t len, uint16_t color)
{
    if (x >= LCD_W || y >= LCD_H || len == 0) return;
    if (x + len > LCD_W) len = LCD_W - x;

    Address_set(x, y, x + len - 1, y);

    for (uint16_t i = 0; i < len; i++)
    {
        LCD_DATA = color;
    }
}

void MD_DrawVLine(uint16_t x, uint16_t y, uint16_t len, uint16_t color)
{
    if (x >= LCD_W || y >= LCD_H || len == 0) return;
    if (y + len > LCD_H) len = LCD_H - y;

    Address_set(x, y, x, y + len - 1);

    for (uint16_t i = 0; i < len; i++)
    {
        LCD_DATA = color;
    }
}

void MD_DrawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color)
{
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
 * Прямоугольники
 * ================================================================ */
void MD_DrawRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color)
{
    if (w == 0 || h == 0) return;
    MD_DrawHLine(x, y, w, color);
    MD_DrawHLine(x, y + h - 1, w, color);
    MD_DrawVLine(x, y, h, color);
    MD_DrawVLine(x + w - 1, y, h, color);
}

void MD_FillRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color)
{
    if (x >= LCD_W || y >= LCD_H || w == 0 || h == 0) return;
    if (x + w > LCD_W) w = LCD_W - x;
    if (y + h > LCD_H) h = LCD_H - y;

    Address_set(x, y, x + w - 1, y + h - 1);

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
 * Круги
 * ================================================================ */
void MD_DrawCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color)
{
    int16_t x = r, y = 0, err = 0;

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

void MD_FillCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color)
{
    MD_DrawVLine(x0, y0 - r, 2 * r + 1, color);

    int16_t x = r, y = 0, err = 0;

    while (x >= y)
    {
        MD_DrawVLine(x0 + x, y0 - y, 2 * y + 1, color);
        MD_DrawVLine(x0 + y, y0 - x, 2 * x + 1, color);
        MD_DrawVLine(x0 - y, y0 - x, 2 * x + 1, color);
        MD_DrawVLine(x0 - x, y0 - y, 2 * y + 1, color);

        y++;
        if (err <= 0) err += 2 * y + 1;
        if (err > 0) { x--; err -= 2 * x + 1; }
    }
}

/* ================================================================
 * Треугольники
 * ================================================================ */
void MD_DrawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color)
{
    MD_DrawLine(x0, y0, x1, y1, color);
    MD_DrawLine(x1, y1, x2, y2, color);
    MD_DrawLine(x2, y2, x0, y0, color);
}

void MD_FillTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color)
{
    int16_t a, b, y, last;

    if (y0 > y1) { int16_t t = y0; y0 = y1; y1 = t; t = x0; x0 = x1; x1 = t; }
    if (y1 > y2) { int16_t t = y1; y1 = y2; y2 = t; t = x1; x1 = x2; x2 = t; }
    if (y0 > y1) { int16_t t = y0; y0 = y1; y1 = t; t = x0; x0 = x1; x1 = t; }

    if (y0 == y2)
    {
        a = b = x0;
        if (x1 < a) a = x1; else if (x1 > b) b = x1;
        if (x2 < a) a = x2; else if (x2 > b) b = x2;
        MD_DrawHLine(a, y0, b - a + 1, color);
        return;
    }

    int16_t dx01 = x1 - x0, dy01 = y1 - y0;
    int16_t dx02 = x2 - x0, dy02 = y2 - y0;
    int16_t dx12 = x2 - x1, dy12 = y2 - y1;
    int32_t sa = 0, sb = 0;

    last = (y1 == y2) ? y1 : y1 - 1;

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
 * Скруглённые прямоугольники
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

    /* Углы */
    int16_t f = 1 - r, ddF_x = 1, ddF_y = -2 * r;
    int16_t px = 0, py = r;

    while (px < py)
    {
        if (f >= 0) { py--; ddF_y += 2; f += ddF_y; }
        px++; ddF_x += 2; f += ddF_x;

        MD_DrawPixel(x + w - r - 1 + px, y + r - py, color);
        MD_DrawPixel(x + w - r - 1 + py, y + r - px, color);
        MD_DrawPixel(x + w - r - 1 + px, y + h - r - 1 + py, color);
        MD_DrawPixel(x + w - r - 1 + py, y + h - r - 1 + px, color);
        MD_DrawPixel(x + r - px, y + h - r - 1 + py, color);
        MD_DrawPixel(x + r - py, y + h - r - 1 + px, color);
        MD_DrawPixel(x + r - px, y + r - py, color);
        MD_DrawPixel(x + r - py, y + r - px, color);
    }
}

void MD_FillRoundRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t r, uint16_t color)
{
    if (w == 0 || h == 0) return;
    if (r > w / 2) r = w / 2;
    if (r > h / 2) r = h / 2;

    MD_FillRect(x + r, y, w - 2 * r, h, color);

    int16_t f = 1 - r, ddF_x = 1, ddF_y = -2 * r;
    int16_t px = 0, py = r;

    while (px < py)
    {
        if (f >= 0) { py--; ddF_y += 2; f += ddF_y; }
        px++; ddF_x += 2; f += ddF_x;

        MD_DrawVLine(x + w - r - 1 + px, y + r - py, h - 2 * r + 2 * py, color);
        MD_DrawVLine(x + w - r - 1 + py, y + r - px, h - 2 * r + 2 * px, color);
        MD_DrawVLine(x + r - px, y + r - py, h - 2 * r + 2 * py, color);
        MD_DrawVLine(x + r - py, y + r - px, h - 2 * r + 2 * px, color);
    }
}

/* ================================================================
 * Чтение пикселя
 * ================================================================ */
uint16_t MD_ReadPixel(uint16_t x, uint16_t y)
{
    if (x >= LCD_W || y >= LCD_H) return 0;

    Address_set(x, y, x, y);
    LCD_CMD = 0x00;  /* Read command */

    return LCD_DATA;
}

/* ================================================================
 * Утилиты цвета
 * ================================================================ */
uint16_t MD_Color(uint8_t r, uint8_t g, uint8_t b)
{
    return RGB565(r, g, b);
}

uint16_t MD_GrayColor(uint8_t gray)
{
    return RGB565_PACK(gray >> 3, gray >> 2, gray >> 3);
}
