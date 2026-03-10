################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa.c \
../Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.c \
../Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.c \
../Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.c 

OBJS += \
./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa.o \
./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.o \
./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.o \
./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.o 

C_DEPS += \
./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa.d \
./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.d \
./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.d \
./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/draw/espressif/ppa/%.o Core/lvgl/src/draw/espressif/ppa/%.su Core/lvgl/src/draw/espressif/ppa/%.cyclo: ../Core/lvgl/src/draw/espressif/ppa/%.c Core/lvgl/src/draw/espressif/ppa/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa

clean-Core-2f-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa:
	-$(RM) ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa.cyclo ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa.d ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa.o ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa.su ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.cyclo ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.d ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.o ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.su ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.cyclo ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.d ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.o ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.su ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.cyclo ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.d ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.o ./Core/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa

