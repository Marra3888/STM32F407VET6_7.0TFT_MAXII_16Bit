################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/debugging/vg_lite_tvg/vg_lite_matrix.c 

OBJS += \
./Core/lvgl/src/debugging/vg_lite_tvg/vg_lite_matrix.o 

C_DEPS += \
./Core/lvgl/src/debugging/vg_lite_tvg/vg_lite_matrix.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/debugging/vg_lite_tvg/%.o Core/lvgl/src/debugging/vg_lite_tvg/%.su Core/lvgl/src/debugging/vg_lite_tvg/%.cyclo: ../Core/lvgl/src/debugging/vg_lite_tvg/%.c Core/lvgl/src/debugging/vg_lite_tvg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-debugging-2f-vg_lite_tvg

clean-Core-2f-lvgl-2f-src-2f-debugging-2f-vg_lite_tvg:
	-$(RM) ./Core/lvgl/src/debugging/vg_lite_tvg/vg_lite_matrix.cyclo ./Core/lvgl/src/debugging/vg_lite_tvg/vg_lite_matrix.d ./Core/lvgl/src/debugging/vg_lite_tvg/vg_lite_matrix.o ./Core/lvgl/src/debugging/vg_lite_tvg/vg_lite_matrix.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-debugging-2f-vg_lite_tvg

