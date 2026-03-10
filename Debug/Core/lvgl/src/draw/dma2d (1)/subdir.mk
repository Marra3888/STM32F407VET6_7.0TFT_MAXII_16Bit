################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/draw/dma2d/lv_draw_dma2d.c \
../Core/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.c \
../Core/lvgl/src/draw/dma2d/lv_draw_dma2d_img.c 

OBJS += \
./Core/lvgl/src/draw/dma2d/lv_draw_dma2d.o \
./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.o \
./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_img.o 

C_DEPS += \
./Core/lvgl/src/draw/dma2d/lv_draw_dma2d.d \
./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.d \
./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_img.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/draw/dma2d/%.o Core/lvgl/src/draw/dma2d/%.su Core/lvgl/src/draw/dma2d/%.cyclo: ../Core/lvgl/src/draw/dma2d/%.c Core/lvgl/src/draw/dma2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-draw-2f-dma2d

clean-Core-2f-lvgl-2f-src-2f-draw-2f-dma2d:
	-$(RM) ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d.cyclo ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d.d ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d.o ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d.su ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.cyclo ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.d ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.o ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_fill.su ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_img.cyclo ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_img.d ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_img.o ./Core/lvgl/src/draw/dma2d/lv_draw_dma2d_img.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-draw-2f-dma2d

