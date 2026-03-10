/*
 * md070sd_final.h
 *
 *  Created on: Mar 1, 2026
 *      Author: Zver
 */

/*
 * md070sd.h
 * Библиотека для TFT дисплея MD070SD 800x480 с CPLD контроллером
 * STM32F407VET6 + FSMC
 *
 * На основе официального демо-кода MD070SD
 *
 * Особенности:
 * - Разрешение: 800x480
 * - Цвет: RGB565 (16 бит)
 * - Подсветка: PWM 300Hz, 0-16 уровней
 * - 8 страниц видеопамяти
 * - Частота обновления: до 13 FPS
 */

#ifndef MD070SD_H
#define MD070SD_H

#include "main.h"

/* ================================================================
 * Разрешение экрана
 * ================================================================ */
#define LCD_W   800
#define LCD_H   480

/* Псевдонимы для совместимости */
#define LCD_WIDTH   LCD_W
#define LCD_HEIGHT  LCD_H

/* ================================================================
 * Количество страниц видеопамяти
 * ================================================================ */
#define LCD_PAGES   8

/* ================================================================
 * Подсветка
 * ================================================================ */
#define BACKLIGHT_OFF   0
#define BACKLIGHT_MIN   1
#define BACKLIGHT_MAX   16

/* ================================================================
 * Адреса FSMC
 * Bank1 NE1 base = 0x60000000
 * RS подключён к PD13 = FSMC_A18
 * Команда: A18=0 → 0x60000000
 * Данные:  A18=1 → 0x60080000
 * ================================================================ */
#define LCD_CMD   (*(volatile uint16_t *)0x60000000)
#define LCD_DATA  (*(volatile uint16_t *)0x60080000)

/* ================================================================
 * Регистры CPLD MD070SD
 * ================================================================ */
#define REG_BACKLIGHT       0x01    /* Яркость подсветки (0-16) */
#define REG_BEGIN_Y         0x02    /* Начальная строка Y1 (0-479) */
#define REG_BEGIN_X         0x03    /* Начальный столбец X1 (0-799) */
#define REG_DISPLAY_PAGE    0x04    /* Страница отображения (0-7) */
#define REG_WRITE_PAGE      0x05    /* Страница записи (0-7) */
#define REG_STOP_Y          0x06    /* Конечная строка Y2 (0-479) */
#define REG_STOP_X          0x07    /* Конечный столбец X2 (0-799) */
#define REG_SLEEP           0x0B    /* Режим сна */
#define REG_DISPLAY_MODE    0x0C    /* Режим отображения */
#define REG_ADDR_DIR        0x0D    /* Направление инкремента */
#define REG_DATA_CHANNEL    0x0F    /* Канал данных */

/* ================================================================
 * Режим отображения
 * ================================================================ */
#define DISPLAY_MODE_NORMAL     0x00
#define DISPLAY_MODE_FLIP_UD    0x01    /* Вверх-вниз */
#define DISPLAY_MODE_FLIP_LR    0x02    /* Лево-право */
#define DISPLAY_MODE_FLIP_BOTH  0x03    /* 180° */
#define DISPLAY_MODE_SELFTEST   0x08    /* Самотест */

/* ================================================================
 * Направление инкремента адреса
 * ================================================================ */
#define ADDR_DIR_ROW    0x00    /* По строке (по умолчанию) */
#define ADDR_DIR_COL    0x01    /* По столбцу */

/* ================================================================
 * Формат цвета: RGB565 (16 бит)
 * D15-D11: R4-R0 (5 бит красный)
 * D10-D5:  G5-G0 (6 бит зелёный)
 * D4-D0:   B4-B0 (5 бит синий)
 * ================================================================ */

/* Базовые цвета */
#define COLOR_BLACK     0x0000
#define COLOR_WHITE     0xFFFF
#define COLOR_RED       0xF800
#define COLOR_GREEN     0x07E0
#define COLOR_BLUE      0x001F
#define COLOR_YELLOW    0xFFE0
#define COLOR_CYAN      0x07FF
#define COLOR_MAGENTA   0xF81F
#define COLOR_ORANGE    0xFD20
#define COLOR_PINK      0xFC18
#define COLOR_BROWN     0x8200

/* Оттенки серого */
#define COLOR_SILVER    0xC618
#define COLOR_GRAY      0x8410
#define COLOR_DARKGRAY  0x4208

/* Веб-цвета */
#define COLOR_MAROON    0x8000
#define COLOR_OLIVE     0x8400
#define COLOR_LIME      0x07E0
#define COLOR_AQUA      0x07FF
#define COLOR_TEAL      0x0410
#define COLOR_NAVY      0x0010
#define COLOR_FUCHSIA   0xF81F
#define COLOR_PURPLE    0x8010

/* ================================================================
 * Макросы преобразования цветов
 * ================================================================ */
#define RGB565(r, g, b)     ((uint16_t)(((r) & 0xF8) << 8) | \
                                        (((g) & 0xFC) << 3) | \
                                        (((b) & 0xF8) >> 3))

#define RGB565_PACK(r5, g6, b5)  ((uint16_t)(((r5) & 0x1F) << 11) | \
                                             (((g6) & 0x3F) << 5) | \
                                             ((b5) & 0x1F))

#define RGB565_RED(c)       (((c) >> 11) & 0x1F)
#define RGB565_GREEN(c)     (((c) >> 5) & 0x3F)
#define RGB565_BLUE(c)      ((c) & 0x1F)

/* ================================================================
 * API функции
 * ================================================================ */

/* Низкоуровневые функции */
void LCD_WR_REG(uint16_t reg);
void LCD_WR_DATA(uint16_t data);
void LCD_WR_DATA8(uint8_t VH, uint8_t VL);

/* Инициализация */
void MD_Init(void);
void MD_Reset(void);

/* Установка адреса */
void Address_set(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2);

/* Подсветка */
void MD_SetBacklight(uint16_t brightness);
void MD_BacklightOn(void);
void MD_BacklightOff(void);

/* Управление страницами */
void WritePage(uint8_t index);
void ShowPage(uint8_t index);
void MD_SwapPages(void);
uint8_t MD_GetDisplayPage(void);
uint8_t MD_GetWritePage(void);

/* Режимы */
void MD_Sleep(uint8_t enable);
void MD_WakeUp(void);
void MD_SetDisplayMode(uint8_t mode);
void MD_SetRotation(uint8_t rotation);
void MD_SetAddressDirection(uint8_t dir);

/* Очистка и заливка */
void LCD_Clear(uint16_t color);
void MD_FillScreen(uint16_t color);

/* Рисование */
void MD_DrawPixel(uint16_t x, uint16_t y, uint16_t color);
void MD_DrawHLine(uint16_t x, uint16_t y, uint16_t len, uint16_t color);
void MD_DrawVLine(uint16_t x, uint16_t y, uint16_t len, uint16_t color);
void MD_DrawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color);
void MD_DrawRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color);
void MD_FillRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color);
void MD_DrawCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color);
void MD_FillCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color);
void MD_DrawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color);
void MD_FillTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color);
void MD_DrawRoundRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t r, uint16_t color);
void MD_FillRoundRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t r, uint16_t color);

/* Чтение данных */
uint16_t MD_ReadPixel(uint16_t x, uint16_t y);

/* Утилиты цвета */
uint16_t MD_Color(uint8_t r, uint8_t g, uint8_t b);
uint16_t MD_GrayColor(uint8_t gray);

#endif /* MD070SD_H */
