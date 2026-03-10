################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/examples/widgets/scale/lv_example_scale_1.c \
../Core/lvgl/examples/widgets/scale/lv_example_scale_10.c \
../Core/lvgl/examples/widgets/scale/lv_example_scale_11.c \
../Core/lvgl/examples/widgets/scale/lv_example_scale_12.c \
../Core/lvgl/examples/widgets/scale/lv_example_scale_2.c \
../Core/lvgl/examples/widgets/scale/lv_example_scale_3.c \
../Core/lvgl/examples/widgets/scale/lv_example_scale_4.c \
../Core/lvgl/examples/widgets/scale/lv_example_scale_5.c \
../Core/lvgl/examples/widgets/scale/lv_example_scale_6.c \
../Core/lvgl/examples/widgets/scale/lv_example_scale_7.c \
../Core/lvgl/examples/widgets/scale/lv_example_scale_8.c \
../Core/lvgl/examples/widgets/scale/lv_example_scale_9.c 

OBJS += \
./Core/lvgl/examples/widgets/scale/lv_example_scale_1.o \
./Core/lvgl/examples/widgets/scale/lv_example_scale_10.o \
./Core/lvgl/examples/widgets/scale/lv_example_scale_11.o \
./Core/lvgl/examples/widgets/scale/lv_example_scale_12.o \
./Core/lvgl/examples/widgets/scale/lv_example_scale_2.o \
./Core/lvgl/examples/widgets/scale/lv_example_scale_3.o \
./Core/lvgl/examples/widgets/scale/lv_example_scale_4.o \
./Core/lvgl/examples/widgets/scale/lv_example_scale_5.o \
./Core/lvgl/examples/widgets/scale/lv_example_scale_6.o \
./Core/lvgl/examples/widgets/scale/lv_example_scale_7.o \
./Core/lvgl/examples/widgets/scale/lv_example_scale_8.o \
./Core/lvgl/examples/widgets/scale/lv_example_scale_9.o 

C_DEPS += \
./Core/lvgl/examples/widgets/scale/lv_example_scale_1.d \
./Core/lvgl/examples/widgets/scale/lv_example_scale_10.d \
./Core/lvgl/examples/widgets/scale/lv_example_scale_11.d \
./Core/lvgl/examples/widgets/scale/lv_example_scale_12.d \
./Core/lvgl/examples/widgets/scale/lv_example_scale_2.d \
./Core/lvgl/examples/widgets/scale/lv_example_scale_3.d \
./Core/lvgl/examples/widgets/scale/lv_example_scale_4.d \
./Core/lvgl/examples/widgets/scale/lv_example_scale_5.d \
./Core/lvgl/examples/widgets/scale/lv_example_scale_6.d \
./Core/lvgl/examples/widgets/scale/lv_example_scale_7.d \
./Core/lvgl/examples/widgets/scale/lv_example_scale_8.d \
./Core/lvgl/examples/widgets/scale/lv_example_scale_9.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/examples/widgets/scale/%.o Core/lvgl/examples/widgets/scale/%.su Core/lvgl/examples/widgets/scale/%.cyclo: ../Core/lvgl/examples/widgets/scale/%.c Core/lvgl/examples/widgets/scale/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-examples-2f-widgets-2f-scale

clean-Core-2f-lvgl-2f-examples-2f-widgets-2f-scale:
	-$(RM) ./Core/lvgl/examples/widgets/scale/lv_example_scale_1.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_1.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_1.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_1.su ./Core/lvgl/examples/widgets/scale/lv_example_scale_10.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_10.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_10.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_10.su ./Core/lvgl/examples/widgets/scale/lv_example_scale_11.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_11.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_11.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_11.su ./Core/lvgl/examples/widgets/scale/lv_example_scale_12.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_12.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_12.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_12.su ./Core/lvgl/examples/widgets/scale/lv_example_scale_2.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_2.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_2.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_2.su ./Core/lvgl/examples/widgets/scale/lv_example_scale_3.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_3.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_3.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_3.su ./Core/lvgl/examples/widgets/scale/lv_example_scale_4.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_4.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_4.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_4.su ./Core/lvgl/examples/widgets/scale/lv_example_scale_5.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_5.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_5.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_5.su ./Core/lvgl/examples/widgets/scale/lv_example_scale_6.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_6.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_6.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_6.su ./Core/lvgl/examples/widgets/scale/lv_example_scale_7.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_7.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_7.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_7.su ./Core/lvgl/examples/widgets/scale/lv_example_scale_8.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_8.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_8.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_8.su ./Core/lvgl/examples/widgets/scale/lv_example_scale_9.cyclo ./Core/lvgl/examples/widgets/scale/lv_example_scale_9.d ./Core/lvgl/examples/widgets/scale/lv_example_scale_9.o ./Core/lvgl/examples/widgets/scale/lv_example_scale_9.su

.PHONY: clean-Core-2f-lvgl-2f-examples-2f-widgets-2f-scale

