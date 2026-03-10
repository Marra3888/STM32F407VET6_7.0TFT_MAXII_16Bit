################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/demos/keypad_encoder/lv_demo_keypad_encoder.c 

OBJS += \
./Core/lvgl/demos/keypad_encoder/lv_demo_keypad_encoder.o 

C_DEPS += \
./Core/lvgl/demos/keypad_encoder/lv_demo_keypad_encoder.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/demos/keypad_encoder/%.o Core/lvgl/demos/keypad_encoder/%.su Core/lvgl/demos/keypad_encoder/%.cyclo: ../Core/lvgl/demos/keypad_encoder/%.c Core/lvgl/demos/keypad_encoder/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-demos-2f-keypad_encoder

clean-Core-2f-lvgl-2f-demos-2f-keypad_encoder:
	-$(RM) ./Core/lvgl/demos/keypad_encoder/lv_demo_keypad_encoder.cyclo ./Core/lvgl/demos/keypad_encoder/lv_demo_keypad_encoder.d ./Core/lvgl/demos/keypad_encoder/lv_demo_keypad_encoder.o ./Core/lvgl/demos/keypad_encoder/lv_demo_keypad_encoder.su

.PHONY: clean-Core-2f-lvgl-2f-demos-2f-keypad_encoder

