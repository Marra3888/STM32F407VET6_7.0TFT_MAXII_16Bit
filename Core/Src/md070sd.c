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

/*
 * md070sd.c
 * Библиотека для TFT дисплея MD070SD 800x480
 * Поддержка шрифта Orbitron (LVGL формат, 8bpp Anti-aliased)
 *
 * Created on: Mar 2, 2026
 * Author: Zver
 */

#include "md070sd.h"
#include "lvgl.h" // Требуется для структур шрифта lv_font_t

/*
 * Ссылка на ваш шрифт Orbitron.
 * Убедитесь, что файл MyFont.c добавлен в проект.
 */
extern const lv_font_t MyFont;

/* ================================================================
 * Базовые макросы и переменные
 * ================================================================ */
static uint8_t currentDisplayPage = 0;
static uint8_t currentWritePage = 0;

static inline void MD_WriteCmd(uint16_t cmd) {
    LCD_CMD = cmd;
}

static inline void MD_WriteData(uint16_t data) {
    LCD_DATA = data;
}

static void MD_WriteCmdData(uint16_t cmd, uint16_t data) {
    LCD_CMD = cmd;
    LCD_DATA = data;
}

/* ================================================================
 * Аппаратный сброс
 * ================================================================ */
void MD_Reset(void) {
#ifdef LCD_RST_Pin
    HAL_GPIO_WritePin(LCD_RST_GPIO_Port, LCD_RST_Pin, GPIO_PIN_RESET);
    HAL_Delay(2);
    HAL_GPIO_WritePin(LCD_RST_GPIO_Port, LCD_RST_Pin, GPIO_PIN_SET);
    HAL_Delay(2);
#else
    HAL_Delay(5); // Если сброс подключен к NRST
#endif
}

/* ================================================================
 * Инициализация дисплея
 * ================================================================ */
void MD_Init(void) {
    MD_Reset();

    // Настройка регистров CPLD
    MD_SetDisplayPage(0);
    MD_SetWritePage(0);
    MD_SetDisplayMode(DISPLAY_MODE_FLIP_LR);
    MD_SetAddressDirection(ADDR_DIR_ROW); // Стандартное направление

    // Включаем канал данных перед очисткой
    MD_WriteCmd(REG_DATA_CHANNEL);

    MD_Clear(COLOR_BLACK);
    MD_BacklightOn();
}

/* ================================================================
 * Управление подсветкой (0-16)
 * ================================================================ */
void MD_SetBacklight(uint16_t brightness) {
    if (brightness > 16) brightness = 16;
    MD_WriteCmdData(REG_BACKLIGHT, brightness);
}

void MD_BacklightOn(void) { MD_SetBacklight(16); }
void MD_BacklightOff(void) { MD_SetBacklight(0); }

/* ================================================================
 * Служебные функции
 * ================================================================ */
void MD_SetDisplayPage(uint8_t page) {
    if (page >= LCD_PAGES) page = 0;
    currentDisplayPage = page;
    MD_WriteCmdData(REG_DISPLAY_PAGE, page);
}

void MD_SetWritePage(uint8_t page) {
    if (page >= LCD_PAGES) page = 0;
    currentWritePage = page;
    MD_WriteCmdData(REG_WRITE_PAGE, page);
}

void MD_SetDisplayMode(uint8_t mode) {
    MD_WriteCmdData(REG_DISPLAY_MODE, mode);
}

void MD_SetAddressDirection(uint8_t dir) {
    MD_WriteCmdData(REG_ADDR_DIR, dir);
}

/* ================================================================
 * Установка окна (области рисования)
 * ================================================================ */
void MD_SetWindow(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2) {
    MD_WriteCmdData(REG_ROW_START, y1);
    MD_WriteCmdData(REG_COL_START, x1);
    MD_WriteCmdData(REG_ROW_END, y2);
    MD_WriteCmdData(REG_COL_END, x2);
    MD_WriteCmd(REG_DATA_CHANNEL); // Подготовка к записи данных
}

/* ================================================================
 * Примитивы рисования
 * ================================================================ */
void MD_FillScreen(uint16_t color) {
    MD_SetWindow(0, 0, LCD_WIDTH - 1, LCD_HEIGHT - 1);
    uint32_t total = (uint32_t)LCD_WIDTH * LCD_HEIGHT;
    while (total--) LCD_DATA = color;
}

void MD_Clear(uint16_t color) {
    MD_FillScreen(color);
}

void MD_DrawPixel(uint16_t x, uint16_t y, uint16_t color) {
    if (x >= LCD_WIDTH || y >= LCD_HEIGHT) return;
    MD_SetWindow(x, y, x, y);
    LCD_DATA = color;
}

void MD_FillRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color) {
    if (x >= LCD_WIDTH || y >= LCD_HEIGHT) return;
    if (x + w > LCD_WIDTH) w = LCD_WIDTH - x;
    if (y + h > LCD_HEIGHT) h = LCD_HEIGHT - y;

    MD_SetWindow(x, y, x + w - 1, y + h - 1);
    uint32_t total = (uint32_t)w * h;
    while (total--) LCD_DATA = color;
}

/* ================================================================
 * Смешивание цветов (Alpha Blending) для сглаживания шрифтов
 * alpha: 0 (фон) ... 255 (текст)
 * ================================================================ */
static inline uint16_t MD_MixColors(uint16_t fg, uint16_t bg, uint8_t alpha) {
    if (alpha == 0) return bg;
    if (alpha == 255) return fg;

    // Распаковка RGB565 (R:5, G:6, B:5)
    uint16_t r_fg = (fg >> 11) & 0x1F;
    uint16_t g_fg = (fg >> 5) & 0x3F;
    uint16_t b_fg = fg & 0x1F;

    uint16_t r_bg = (bg >> 11) & 0x1F;
    uint16_t g_bg = (bg >> 5) & 0x3F;
    uint16_t b_bg = bg & 0x1F;

    // Смешивание: result = (fg * a + bg * (255 - a)) / 255
    uint16_t inv_alpha = 255 - alpha;

    // Используем упрощенное деление на 256 (сдвиг >> 8) для скорости
    uint16_t r = (r_fg * alpha + r_bg * inv_alpha) >> 8;
    uint16_t g = (g_fg * alpha + g_bg * inv_alpha) >> 8;
    uint16_t b = (b_fg * alpha + b_bg * inv_alpha) >> 8;

    return (r << 11) | (g << 5) | b;
}

/* ================================================================
 * РИСОВАНИЕ ШРИФТА ORBITRON (8bpp)
 * ================================================================ */

/*
 * Вывод одного символа шрифта Orbitron
 * x, y - координаты левого верхнего угла строки (не базовой линии)
 */
void MD_DrawChar(uint16_t x, uint16_t y, char c, uint16_t color, uint16_t bg) {
    // Достаем дескрипторы шрифта LVGL
    const lv_font_fmt_txt_dsc_t * fdsc = (const lv_font_fmt_txt_dsc_t *)MyFont.dsc;
    const lv_font_fmt_txt_cmap_t * cmaps = fdsc->cmaps; // В вашем шрифте 1 cmap

    // 1. Поиск ID глифа по коду ASCII
    uint32_t unicode = (uint32_t)c;
    uint32_t glyph_id = 0;

    // Проверяем диапазон (в MyFont.c range_start=47, length=12: / 0..9 :)
    if (unicode >= cmaps->range_start && unicode < (cmaps->range_start + cmaps->list_length)) {
        // Если cmap type 0 (массива юникода нет, символы идут подряд)
        glyph_id = cmaps->glyph_id_start + (unicode - cmaps->range_start);
    } else {
        return; // Символ не найден в шрифте
    }

    // 2. Получаем параметры глифа
    const lv_font_fmt_txt_glyph_dsc_t * gdsc = &fdsc->glyph_dsc[glyph_id];

    uint16_t w = gdsc->box_w;
    uint16_t h = gdsc->box_h;

    if (w == 0 || h == 0) return; // Пробел или пустой символ

    // 3. Расчет позиции вывода (LVGL хранит ofs_y от базовой линии вверх)
    // line_height шрифта = 30.
    // Реальный Y начала отрисовки битмапа:
    // y (верх строки) + (line_height - base_line) - box_h - ofs_y
    // Для упрощения, если шрифт генерировался без сложных смещений, можно подбирать.
    // Стандартная формула LVGL -> экран:
    uint16_t draw_x = x + gdsc->ofs_x;
    uint16_t draw_y = y + (MyFont.line_height - MyFont.base_line - h - gdsc->ofs_y);

    // 4. Получаем указатель на начало данных битмапа
    const uint8_t * bitmap = fdsc->glyph_bitmap + gdsc->bitmap_index;

    // 5. Отрисовка
    // Устанавливаем окно дисплея строго по размеру символа (box_w * box_h)
    MD_SetWindow(draw_x, draw_y, draw_x + w - 1, draw_y + h - 1);

    // В битмапе данные идут построчно. 8 бит = 1 пиксель (альфа канал)
    for (int i = 0; i < w * h; i++) {
        uint8_t alpha = bitmap[i];

        // Оптимизация: если пиксель прозрачный (0) - пишем фон
        // Если непрозрачный (255) - пишем цвет
        // Иначе смешиваем
        if (alpha == 0) {
            LCD_DATA = bg;
        } else if (alpha == 255) {
            LCD_DATA = color;
        } else {
            LCD_DATA = MD_MixColors(color, bg, alpha);
        }
    }
}

/*
 * Вывод строки.
 * Поддерживает только символы, имеющиеся в шрифте (0-9, :, /)
 */
void MD_DrawString(uint16_t x, uint16_t y, const char *str, uint16_t color, uint16_t bg) {
    uint16_t curr_x = x;
    const lv_font_fmt_txt_dsc_t * fdsc = (const lv_font_fmt_txt_dsc_t *)MyFont.dsc;
    const lv_font_fmt_txt_cmap_t * cmaps = fdsc->cmaps;

    while (*str) {
        char c = *str++;

        if (c == ' ') {
            // Ширина пробела
            uint16_t space_w = 10;
            MD_FillRect(curr_x, y, space_w, MyFont.line_height, bg);
            curr_x += space_w;
            continue;
        }

        uint32_t unicode = (uint32_t)c;
        uint32_t glyph_id = 0;

        if (unicode >= cmaps->range_start && unicode < (cmaps->range_start + cmaps->list_length)) {
            glyph_id = cmaps->glyph_id_start + (unicode - cmaps->range_start);

            // Рисуем символ
            MD_DrawChar(curr_x, y, c, color, bg);

            // Сдвигаем курсор. adv_w хранится в формате fixed point 4 бита (умножено на 16)
            uint16_t adv_w = fdsc->glyph_dsc[glyph_id].adv_w >> 4;

            // Если adv_w = 0 (ошибка генерации), берем ширину бокса + отступ
            if (adv_w == 0) adv_w = fdsc->glyph_dsc[glyph_id].box_w + 2;

            curr_x += adv_w;
        } else {
            // Если символа нет в шрифте, пропускаем или рисуем квадрат
            // (в данном примере просто пропускаем)
        }
    }
}
