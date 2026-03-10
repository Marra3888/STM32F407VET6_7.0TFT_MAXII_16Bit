################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/examples/others/gestures/lv_example_gestures.c 

OBJS += \
./Core/lvgl/examples/others/gestures/lv_example_gestures.o 

C_DEPS += \
./Core/lvgl/examples/others/gestures/lv_example_gestures.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/examples/others/gestures/%.o Core/lvgl/examples/others/gestures/%.su Core/lvgl/examples/others/gestures/%.cyclo: ../Core/lvgl/examples/others/gestures/%.c Core/lvgl/examples/others/gestures/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-examples-2f-others-2f-gestures

clean-Core-2f-lvgl-2f-examples-2f-others-2f-gestures:
	-$(RM) ./Core/lvgl/examples/others/gestures/lv_example_gestures.cyclo ./Core/lvgl/examples/others/gestures/lv_example_gestures.d ./Core/lvgl/examples/others/gestures/lv_example_gestures.o ./Core/lvgl/examples/others/gestures/lv_example_gestures.su

.PHONY: clean-Core-2f-lvgl-2f-examples-2f-others-2f-gestures

