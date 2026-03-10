################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/drivers/draw/eve/lv_draw_eve_display.c 

OBJS += \
./Core/lvgl/src/drivers/draw/eve/lv_draw_eve_display.o 

C_DEPS += \
./Core/lvgl/src/drivers/draw/eve/lv_draw_eve_display.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/drivers/draw/eve/%.o Core/lvgl/src/drivers/draw/eve/%.su Core/lvgl/src/drivers/draw/eve/%.cyclo: ../Core/lvgl/src/drivers/draw/eve/%.c Core/lvgl/src/drivers/draw/eve/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-draw-2f-eve

clean-Core-2f-lvgl-2f-src-2f-drivers-2f-draw-2f-eve:
	-$(RM) ./Core/lvgl/src/drivers/draw/eve/lv_draw_eve_display.cyclo ./Core/lvgl/src/drivers/draw/eve/lv_draw_eve_display.d ./Core/lvgl/src/drivers/draw/eve/lv_draw_eve_display.o ./Core/lvgl/src/drivers/draw/eve/lv_draw_eve_display.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-draw-2f-eve

