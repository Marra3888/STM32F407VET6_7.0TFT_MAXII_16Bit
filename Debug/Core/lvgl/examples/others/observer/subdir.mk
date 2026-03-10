################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/examples/others/observer/lv_example_observer_1.c \
../Core/lvgl/examples/others/observer/lv_example_observer_2.c \
../Core/lvgl/examples/others/observer/lv_example_observer_3.c \
../Core/lvgl/examples/others/observer/lv_example_observer_4.c \
../Core/lvgl/examples/others/observer/lv_example_observer_5.c \
../Core/lvgl/examples/others/observer/lv_example_observer_6.c \
../Core/lvgl/examples/others/observer/lv_example_observer_7.c 

OBJS += \
./Core/lvgl/examples/others/observer/lv_example_observer_1.o \
./Core/lvgl/examples/others/observer/lv_example_observer_2.o \
./Core/lvgl/examples/others/observer/lv_example_observer_3.o \
./Core/lvgl/examples/others/observer/lv_example_observer_4.o \
./Core/lvgl/examples/others/observer/lv_example_observer_5.o \
./Core/lvgl/examples/others/observer/lv_example_observer_6.o \
./Core/lvgl/examples/others/observer/lv_example_observer_7.o 

C_DEPS += \
./Core/lvgl/examples/others/observer/lv_example_observer_1.d \
./Core/lvgl/examples/others/observer/lv_example_observer_2.d \
./Core/lvgl/examples/others/observer/lv_example_observer_3.d \
./Core/lvgl/examples/others/observer/lv_example_observer_4.d \
./Core/lvgl/examples/others/observer/lv_example_observer_5.d \
./Core/lvgl/examples/others/observer/lv_example_observer_6.d \
./Core/lvgl/examples/others/observer/lv_example_observer_7.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/examples/others/observer/%.o Core/lvgl/examples/others/observer/%.su Core/lvgl/examples/others/observer/%.cyclo: ../Core/lvgl/examples/others/observer/%.c Core/lvgl/examples/others/observer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-examples-2f-others-2f-observer

clean-Core-2f-lvgl-2f-examples-2f-others-2f-observer:
	-$(RM) ./Core/lvgl/examples/others/observer/lv_example_observer_1.cyclo ./Core/lvgl/examples/others/observer/lv_example_observer_1.d ./Core/lvgl/examples/others/observer/lv_example_observer_1.o ./Core/lvgl/examples/others/observer/lv_example_observer_1.su ./Core/lvgl/examples/others/observer/lv_example_observer_2.cyclo ./Core/lvgl/examples/others/observer/lv_example_observer_2.d ./Core/lvgl/examples/others/observer/lv_example_observer_2.o ./Core/lvgl/examples/others/observer/lv_example_observer_2.su ./Core/lvgl/examples/others/observer/lv_example_observer_3.cyclo ./Core/lvgl/examples/others/observer/lv_example_observer_3.d ./Core/lvgl/examples/others/observer/lv_example_observer_3.o ./Core/lvgl/examples/others/observer/lv_example_observer_3.su ./Core/lvgl/examples/others/observer/lv_example_observer_4.cyclo ./Core/lvgl/examples/others/observer/lv_example_observer_4.d ./Core/lvgl/examples/others/observer/lv_example_observer_4.o ./Core/lvgl/examples/others/observer/lv_example_observer_4.su ./Core/lvgl/examples/others/observer/lv_example_observer_5.cyclo ./Core/lvgl/examples/others/observer/lv_example_observer_5.d ./Core/lvgl/examples/others/observer/lv_example_observer_5.o ./Core/lvgl/examples/others/observer/lv_example_observer_5.su ./Core/lvgl/examples/others/observer/lv_example_observer_6.cyclo ./Core/lvgl/examples/others/observer/lv_example_observer_6.d ./Core/lvgl/examples/others/observer/lv_example_observer_6.o ./Core/lvgl/examples/others/observer/lv_example_observer_6.su ./Core/lvgl/examples/others/observer/lv_example_observer_7.cyclo ./Core/lvgl/examples/others/observer/lv_example_observer_7.d ./Core/lvgl/examples/others/observer/lv_example_observer_7.o ./Core/lvgl/examples/others/observer/lv_example_observer_7.su

.PHONY: clean-Core-2f-lvgl-2f-examples-2f-others-2f-observer

