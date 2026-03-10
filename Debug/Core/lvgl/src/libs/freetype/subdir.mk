################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/libs/freetype/lv_freetype.c \
../Core/lvgl/src/libs/freetype/lv_freetype_glyph.c \
../Core/lvgl/src/libs/freetype/lv_freetype_image.c \
../Core/lvgl/src/libs/freetype/lv_freetype_outline.c \
../Core/lvgl/src/libs/freetype/lv_ftsystem.c 

OBJS += \
./Core/lvgl/src/libs/freetype/lv_freetype.o \
./Core/lvgl/src/libs/freetype/lv_freetype_glyph.o \
./Core/lvgl/src/libs/freetype/lv_freetype_image.o \
./Core/lvgl/src/libs/freetype/lv_freetype_outline.o \
./Core/lvgl/src/libs/freetype/lv_ftsystem.o 

C_DEPS += \
./Core/lvgl/src/libs/freetype/lv_freetype.d \
./Core/lvgl/src/libs/freetype/lv_freetype_glyph.d \
./Core/lvgl/src/libs/freetype/lv_freetype_image.d \
./Core/lvgl/src/libs/freetype/lv_freetype_outline.d \
./Core/lvgl/src/libs/freetype/lv_ftsystem.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/libs/freetype/%.o Core/lvgl/src/libs/freetype/%.su Core/lvgl/src/libs/freetype/%.cyclo: ../Core/lvgl/src/libs/freetype/%.c Core/lvgl/src/libs/freetype/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-libs-2f-freetype

clean-Core-2f-lvgl-2f-src-2f-libs-2f-freetype:
	-$(RM) ./Core/lvgl/src/libs/freetype/lv_freetype.cyclo ./Core/lvgl/src/libs/freetype/lv_freetype.d ./Core/lvgl/src/libs/freetype/lv_freetype.o ./Core/lvgl/src/libs/freetype/lv_freetype.su ./Core/lvgl/src/libs/freetype/lv_freetype_glyph.cyclo ./Core/lvgl/src/libs/freetype/lv_freetype_glyph.d ./Core/lvgl/src/libs/freetype/lv_freetype_glyph.o ./Core/lvgl/src/libs/freetype/lv_freetype_glyph.su ./Core/lvgl/src/libs/freetype/lv_freetype_image.cyclo ./Core/lvgl/src/libs/freetype/lv_freetype_image.d ./Core/lvgl/src/libs/freetype/lv_freetype_image.o ./Core/lvgl/src/libs/freetype/lv_freetype_image.su ./Core/lvgl/src/libs/freetype/lv_freetype_outline.cyclo ./Core/lvgl/src/libs/freetype/lv_freetype_outline.d ./Core/lvgl/src/libs/freetype/lv_freetype_outline.o ./Core/lvgl/src/libs/freetype/lv_freetype_outline.su ./Core/lvgl/src/libs/freetype/lv_ftsystem.cyclo ./Core/lvgl/src/libs/freetype/lv_ftsystem.d ./Core/lvgl/src/libs/freetype/lv_ftsystem.o ./Core/lvgl/src/libs/freetype/lv_ftsystem.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-libs-2f-freetype

