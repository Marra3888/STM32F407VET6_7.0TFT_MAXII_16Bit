################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_1.c \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_10.c \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_11.c \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_12.c \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_2.c \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_3.c \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_4.c \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_5.c \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_6.c \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_7.c \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_8.c \
../Core/lvgl/examples/widgets/canvas/lv_example_canvas_9.c 

OBJS += \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_1.o \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_10.o \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_11.o \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_12.o \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_2.o \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_3.o \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_4.o \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_5.o \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_6.o \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_7.o \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_8.o \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_9.o 

C_DEPS += \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_1.d \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_10.d \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_11.d \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_12.d \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_2.d \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_3.d \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_4.d \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_5.d \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_6.d \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_7.d \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_8.d \
./Core/lvgl/examples/widgets/canvas/lv_example_canvas_9.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/examples/widgets/canvas/%.o Core/lvgl/examples/widgets/canvas/%.su Core/lvgl/examples/widgets/canvas/%.cyclo: ../Core/lvgl/examples/widgets/canvas/%.c Core/lvgl/examples/widgets/canvas/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-examples-2f-widgets-2f-canvas

clean-Core-2f-lvgl-2f-examples-2f-widgets-2f-canvas:
	-$(RM) ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_1.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_1.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_1.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_1.su ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_10.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_10.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_10.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_10.su ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_11.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_11.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_11.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_11.su ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_12.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_12.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_12.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_12.su ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_2.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_2.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_2.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_2.su ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_3.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_3.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_3.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_3.su ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_4.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_4.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_4.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_4.su ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_5.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_5.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_5.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_5.su ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_6.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_6.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_6.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_6.su ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_7.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_7.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_7.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_7.su ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_8.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_8.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_8.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_8.su ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_9.cyclo ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_9.d ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_9.o ./Core/lvgl/examples/widgets/canvas/lv_example_canvas_9.su

.PHONY: clean-Core-2f-lvgl-2f-examples-2f-widgets-2f-canvas

