################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/examples/event/lv_example_event_bubble.c \
../Core/lvgl/examples/event/lv_example_event_button.c \
../Core/lvgl/examples/event/lv_example_event_click.c \
../Core/lvgl/examples/event/lv_example_event_draw.c \
../Core/lvgl/examples/event/lv_example_event_streak.c \
../Core/lvgl/examples/event/lv_example_event_trickle.c 

OBJS += \
./Core/lvgl/examples/event/lv_example_event_bubble.o \
./Core/lvgl/examples/event/lv_example_event_button.o \
./Core/lvgl/examples/event/lv_example_event_click.o \
./Core/lvgl/examples/event/lv_example_event_draw.o \
./Core/lvgl/examples/event/lv_example_event_streak.o \
./Core/lvgl/examples/event/lv_example_event_trickle.o 

C_DEPS += \
./Core/lvgl/examples/event/lv_example_event_bubble.d \
./Core/lvgl/examples/event/lv_example_event_button.d \
./Core/lvgl/examples/event/lv_example_event_click.d \
./Core/lvgl/examples/event/lv_example_event_draw.d \
./Core/lvgl/examples/event/lv_example_event_streak.d \
./Core/lvgl/examples/event/lv_example_event_trickle.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/examples/event/%.o Core/lvgl/examples/event/%.su Core/lvgl/examples/event/%.cyclo: ../Core/lvgl/examples/event/%.c Core/lvgl/examples/event/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-examples-2f-event

clean-Core-2f-lvgl-2f-examples-2f-event:
	-$(RM) ./Core/lvgl/examples/event/lv_example_event_bubble.cyclo ./Core/lvgl/examples/event/lv_example_event_bubble.d ./Core/lvgl/examples/event/lv_example_event_bubble.o ./Core/lvgl/examples/event/lv_example_event_bubble.su ./Core/lvgl/examples/event/lv_example_event_button.cyclo ./Core/lvgl/examples/event/lv_example_event_button.d ./Core/lvgl/examples/event/lv_example_event_button.o ./Core/lvgl/examples/event/lv_example_event_button.su ./Core/lvgl/examples/event/lv_example_event_click.cyclo ./Core/lvgl/examples/event/lv_example_event_click.d ./Core/lvgl/examples/event/lv_example_event_click.o ./Core/lvgl/examples/event/lv_example_event_click.su ./Core/lvgl/examples/event/lv_example_event_draw.cyclo ./Core/lvgl/examples/event/lv_example_event_draw.d ./Core/lvgl/examples/event/lv_example_event_draw.o ./Core/lvgl/examples/event/lv_example_event_draw.su ./Core/lvgl/examples/event/lv_example_event_streak.cyclo ./Core/lvgl/examples/event/lv_example_event_streak.d ./Core/lvgl/examples/event/lv_example_event_streak.o ./Core/lvgl/examples/event/lv_example_event_streak.su ./Core/lvgl/examples/event/lv_example_event_trickle.cyclo ./Core/lvgl/examples/event/lv_example_event_trickle.d ./Core/lvgl/examples/event/lv_example_event_trickle.o ./Core/lvgl/examples/event/lv_example_event_trickle.su

.PHONY: clean-Core-2f-lvgl-2f-examples-2f-event

