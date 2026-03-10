/*
 * lcd_ssd1963.h
 *
 *  Created on: Mar 1, 2026
 *      Author: Zver
 */

/*
 * md070sd.h
 * Библиотека для TFT дисплея MD070SD 800x480 с CPLD контроллером
 * STM32F407VET6 + FSMC
 *
 * Особенности MD070SD:
 * - Подсветка: PWM 300Hz, без мерцания, значения 0-16
 * - 8 страниц видеопамяти для двойной буферизации
 * - Автоинкремент адреса по строке или столбцу
 * - Максимальная частота обновления: 13 FPS
 */

#ifndef MD070SD_H
#define MD070SD_H

#include "main.h"

/* ================================================================
 * Разрешение экрана
 * ================================================================ */
#define LCD_WIDTH   800
#define LCD_HEIGHT  480

/* ================================================================
 * Количество страниц видеопамяти
 * ================================================================ */
#define LCD_PAGES   8

/* ================================================================
 * Подсветка
 * PWM 300Hz, без мерцания
 * При включении питания значение = 0 (выключена)
 * Максимальное значение = 16 (0x10)
 * Значения > 16 игнорируются
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
#define REG_READ_DATA       0x0000  /* Чтение данных из RAM (RD=0) */
#define REG_BACKLIGHT       0x0001  /* Яркость подсветки (0-16) */
#define REG_ROW_START       0x0002  /* Начальная строка Y1 (0-479) */
#define REG_COL_START       0x0003  /* Начальный столбец X1 (0-799) */
#define REG_DISPLAY_PAGE    0x0004  /* Страница отображения (0-7) */
#define REG_WRITE_PAGE      0x0005  /* Страница записи/чтения (0-7) */
#define REG_ROW_END         0x0006  /* Конечная строка Y2 (0-479) */
#define REG_COL_END         0x0007  /* Конечный столбец X2 (0-799) */
#define REG_SLEEP           0x000B  /* Режим сна (0=норм, 1=сон) */
#define REG_DISPLAY_MODE    0x000C  /* Режим отображения */
#define REG_ADDR_DIR        0x000D  /* Направление инкремента адреса */
#define REG_DATA_CHANNEL    0x000F  /* Канал данных (начать запись) */

/* ================================================================
 * Биты регистра REG_DISPLAY_MODE (0x000C)
 * Bit0: U/D (переворот вверх-вниз)
 * Bit1: L/R (переворот лево-право)
 * Bit[3:2]: 0=нормальный режим, 2=режим самотеста LCD
 * ================================================================ */
#define DISPLAY_MODE_NORMAL     0x0000
#define DISPLAY_MODE_FLIP_UD    0x0001  /* Переворот вверх-вниз */
#define DISPLAY_MODE_FLIP_LR    0x0002  /* Переворот лево-право */
#define DISPLAY_MODE_FLIP_BOTH  0x0003  /* Поворот на 180° */
#define DISPLAY_MODE_SELFTEST   0x0008  /* Режим самотеста LCD */

/* ================================================================
 * Направление инкремента адреса (REG_ADDR_DIR 0x000D)
 * Адрес автоматически увеличивается на 1 при непрерывной записи
 * При достижении конца строки/столбца — переход к началу
 * ================================================================ */
#define ADDR_DIR_ROW    0x0000  /* Автоинкремент по строке (по умолчанию) */
#define ADDR_DIR_COL    0x0001  /* Автоинкремент по столбцу */

/* ================================================================
 * Формат цвета: RGB565 (16 бит)
 *
 * D15-D11: R4-R0 (5 бит красный, 0-31)
 * D10-D5:  G5-G0 (6 бит зелёный, 0-63)
 * D4-D0:   B4-B0 (5 бит синий, 0-31)
 *
 * Таблица базовых цветов:
 * Цвет           R4-R0  G5-G0  B4-B0   HEX
 * ─────────────────────────────────────────
 * Чёрный         00000  000000 00000   0x0000
 * Белый          11111  111111 11111   0xFFFF
 * Красный        11111  000000 00000   0xF800
 * Зелёный        00000  111111 00000   0x07E0
 * Синий          00000  000000 11111   0x001F
 * Жёлтый         11111  111111 00000   0xFFE0
 * Голубой        00000  111111 11111   0x07FF
 * Фиолетовый     11111  000000 11111   0xF81F
 * ================================================================ */
/* ================================================================
 * Базовые цвета RGB565
 * ================================================================ */
#define COLOR_BLACK     0x0000  /* R:0   G:0   B:0   */
#define COLOR_WHITE     0xFFFF  /* R:31  G:63  B:31  */
#define COLOR_RED       0xF800  /* R:31  G:0   B:0   */
#define COLOR_GREEN     0x07E0  /* R:0   G:63  B:0   */
#define COLOR_BLUE      0x001F  /* R:0   G:0   B:31  */
#define COLOR_YELLOW    0xFFE0  /* R:31  G:63  B:0   */
#define COLOR_CYAN      0x07FF  /* R:0   G:63  B:31  */
#define COLOR_MAGENTA   0xF81F  /* R:31  G:0   B:31  */

/* ================================================================
 * Дополнительные цвета
 * ================================================================ */
#define COLOR_ORANGE    0xFD20  /* R:31  G:41  B:0   */
#define COLOR_PINK      0xFC18  /* R:31  G:48  B:24  */
#define COLOR_BROWN     0x8200  /* R:16  G:16  B:0   */

/* ================================================================
 * Оттенки серого (8 уровней)
 * ================================================================ */
#define COLOR_GRAY_0    0x0000  /* Чёрный */
#define COLOR_GRAY_1    0x2104  /* 12.5%  */
#define COLOR_GRAY_2    0x4208  /* 25%    */
#define COLOR_GRAY_3    0x630C  /* 37.5%  */
#define COLOR_GRAY_4    0x8410  /* 50%    */
#define COLOR_GRAY_5    0xA514  /* 62.5%  */
#define COLOR_GRAY_6    0xC618  /* 75%    */
#define COLOR_GRAY_7    0xE71C  /* 87.5%  */

/* ================================================================
 * Веб-цвета
 * ================================================================ */
#define COLOR_SILVER    0xC618  /* R:24  G:48  B:24  */
#define COLOR_GRAY      0x8410  /* R:16  G:32  B:16  */
#define COLOR_MAROON    0x8000  /* R:16  G:0   B:0   */
#define COLOR_OLIVE     0x8400  /* R:16  G:32  B:0   */
#define COLOR_LIME      0x07E0  /* R:0   G:63  B:0   */
#define COLOR_AQUA      0x07FF  /* R:0   G:63  B:31  */
#define COLOR_TEAL      0x0410  /* R:0   G:32  B:16  */
#define COLOR_NAVY      0x0010  /* R:0   G:0   B:16  */
#define COLOR_FUCHSIA   0xF81F  /* R:31  G:0   B:31  */
#define COLOR_PURPLE    0x8010  /* R:16  G:0   B:16  */

/* ================================================================
 * Оттенки красного (8 уровней)
 * ================================================================ */
#define COLOR_RED_0     0x0000  /* Чёрный */
#define COLOR_RED_1     0x2000  /* R:4   */
#define COLOR_RED_2     0x4000  /* R:8   */
#define COLOR_RED_3     0x6000  /* R:12  */
#define COLOR_RED_4     0x8000  /* R:16  */
#define COLOR_RED_5     0xA000  /* R:20  */
#define COLOR_RED_6     0xC000  /* R:24  */
#define COLOR_RED_7     0xE000  /* R:28  */
#define COLOR_RED_MAX   0xF800  /* R:31  */

/* ================================================================
 * Оттенки зелёного (8 уровней)
 * ================================================================ */
#define COLOR_GREEN_0   0x0000  /* Чёрный */
#define COLOR_GREEN_1   0x00E0  /* G:7   */
#define COLOR_GREEN_2   0x01E0  /* G:15  */
#define COLOR_GREEN_3   0x02E0  /* G:23  */
#define COLOR_GREEN_4   0x03E0  /* G:31  */
#define COLOR_GREEN_5   0x04E0  /* G:39  */
#define COLOR_GREEN_6   0x05E0  /* G:47  */
#define COLOR_GREEN_7   0x06E0  /* G:55  */
#define COLOR_GREEN_MAX 0x07E0  /* G:63  */

/* ================================================================
 * Оттенки синего (8 уровней)
 * ================================================================ */
#define COLOR_BLUE_0    0x0000  /* Чёрный */
#define COLOR_BLUE_1    0x0004  /* B:4   */
#define COLOR_BLUE_2    0x0008  /* B:8   */
#define COLOR_BLUE_3    0x000C  /* B:12  */
#define COLOR_BLUE_4    0x0010  /* B:16  */
#define COLOR_BLUE_5    0x0014  /* B:20  */
#define COLOR_BLUE_6    0x0018  /* B:24  */
#define COLOR_BLUE_7    0x001C  /* B:28  */
#define COLOR_BLUE_MAX  0x001F  /* B:31  */

/* ================================================================
 * Макрос RGB -> RGB565
 * ================================================================ */
#define RGB565(r, g, b) ((uint16_t)(((r) & 0xF8) << 8) | \
                                    (((g) & 0xFC) << 3) | \
                                    (((b) & 0xF8) >> 3))

/* ================================================================
 * Инициализация и сброс
 * ================================================================ */
void MD_Reset(void);
void MD_Init(void);

/* ================================================================
 * Подсветка (0-16)
 * ================================================================ */
void MD_SetBacklight(uint16_t brightness);
void MD_BacklightOn(void);
void MD_BacklightOff(void);

/* ================================================================
 * Управление страницами (двойная/множественная буферизация)
 * ================================================================ */
void MD_SetDisplayPage(uint8_t page);
void MD_SetWritePage(uint8_t page);
void MD_SwapPages(void);
uint8_t MD_GetDisplayPage(void);
uint8_t MD_GetWritePage(void);

/* ================================================================
 * Режимы работы
 * ================================================================ */
void MD_Sleep(uint8_t enable);
void MD_WakeUp(void);
void MD_SetDisplayMode(uint8_t mode);
void MD_SetRotation(uint8_t rotation);
void MD_SetAddressDirection(uint8_t dir);

/* ================================================================
 * Окно вывода
 * ================================================================ */
void MD_SetWindow(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2);

/* ================================================================
 * Очистка и заливка
 * ================================================================ */
void MD_FillScreen(uint16_t color);
void MD_Clear(uint16_t color);

/* ================================================================
 * Рисование примитивов
 * ================================================================ */
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

/* ================================================================
 * Чтение данных
 * ================================================================ */
uint16_t MD_ReadPixel(uint16_t x, uint16_t y);
void MD_ReadRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t *buffer);

/* ================================================================
 * Копирование областей
 * ================================================================ */
void MD_CopyRect(uint16_t srcX, uint16_t srcY, uint16_t dstX, uint16_t dstY, uint16_t w, uint16_t h);

/* ================================================================
 * Вывод текста
 * ================================================================ */
//void MD_DrawChar16x24(uint16_t x, uint16_t y, char c, uint16_t color, uint16_t bg);
//void MD_DrawString16x24(uint16_t x, uint16_t y, const char *str, uint16_t color, uint16_t bg);
//void MD_DrawCharScaled(uint16_t x, uint16_t y, char c, uint8_t scale, uint16_t color, uint16_t bg);
//void MD_DrawStringScaled(uint16_t x, uint16_t y, const char *str, uint8_t scale, uint16_t color, uint16_t bg);

/* ================================================================
 * Текст (шрифт Orbitron 8bpp)
 * ================================================================ */
void MD_DrawChar(uint16_t x, uint16_t y, char c, uint16_t color, uint16_t bg);
void MD_DrawString(uint16_t x, uint16_t y, const char *str, uint16_t color, uint16_t bg);

#endif /* MD070SD_H */
