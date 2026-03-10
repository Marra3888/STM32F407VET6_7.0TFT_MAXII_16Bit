################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/env_support/pikascript/pika_lv_point_t.c \
../Core/lvgl/env_support/pikascript/pika_lv_timer_t.c \
../Core/lvgl/env_support/pikascript/pika_lv_wegit.c \
../Core/lvgl/env_support/pikascript/pika_lvgl.c \
../Core/lvgl/env_support/pikascript/pika_lvgl_indev_t.c \
../Core/lvgl/env_support/pikascript/pika_lvgl_lv_event.c \
../Core/lvgl/env_support/pikascript/pika_lvgl_lv_obj.c \
../Core/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.c 

OBJS += \
./Core/lvgl/env_support/pikascript/pika_lv_point_t.o \
./Core/lvgl/env_support/pikascript/pika_lv_timer_t.o \
./Core/lvgl/env_support/pikascript/pika_lv_wegit.o \
./Core/lvgl/env_support/pikascript/pika_lvgl.o \
./Core/lvgl/env_support/pikascript/pika_lvgl_indev_t.o \
./Core/lvgl/env_support/pikascript/pika_lvgl_lv_event.o \
./Core/lvgl/env_support/pikascript/pika_lvgl_lv_obj.o \
./Core/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.o 

C_DEPS += \
./Core/lvgl/env_support/pikascript/pika_lv_point_t.d \
./Core/lvgl/env_support/pikascript/pika_lv_timer_t.d \
./Core/lvgl/env_support/pikascript/pika_lv_wegit.d \
./Core/lvgl/env_support/pikascript/pika_lvgl.d \
./Core/lvgl/env_support/pikascript/pika_lvgl_indev_t.d \
./Core/lvgl/env_support/pikascript/pika_lvgl_lv_event.d \
./Core/lvgl/env_support/pikascript/pika_lvgl_lv_obj.d \
./Core/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/env_support/pikascript/%.o Core/lvgl/env_support/pikascript/%.su Core/lvgl/env_support/pikascript/%.cyclo: ../Core/lvgl/env_support/pikascript/%.c Core/lvgl/env_support/pikascript/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-env_support-2f-pikascript

clean-Core-2f-lvgl-2f-env_support-2f-pikascript:
	-$(RM) ./Core/lvgl/env_support/pikascript/pika_lv_point_t.cyclo ./Core/lvgl/env_support/pikascript/pika_lv_point_t.d ./Core/lvgl/env_support/pikascript/pika_lv_point_t.o ./Core/lvgl/env_support/pikascript/pika_lv_point_t.su ./Core/lvgl/env_support/pikascript/pika_lv_timer_t.cyclo ./Core/lvgl/env_support/pikascript/pika_lv_timer_t.d ./Core/lvgl/env_support/pikascript/pika_lv_timer_t.o ./Core/lvgl/env_support/pikascript/pika_lv_timer_t.su ./Core/lvgl/env_support/pikascript/pika_lv_wegit.cyclo ./Core/lvgl/env_support/pikascript/pika_lv_wegit.d ./Core/lvgl/env_support/pikascript/pika_lv_wegit.o ./Core/lvgl/env_support/pikascript/pika_lv_wegit.su ./Core/lvgl/env_support/pikascript/pika_lvgl.cyclo ./Core/lvgl/env_support/pikascript/pika_lvgl.d ./Core/lvgl/env_support/pikascript/pika_lvgl.o ./Core/lvgl/env_support/pikascript/pika_lvgl.su ./Core/lvgl/env_support/pikascript/pika_lvgl_indev_t.cyclo ./Core/lvgl/env_support/pikascript/pika_lvgl_indev_t.d ./Core/lvgl/env_support/pikascript/pika_lvgl_indev_t.o ./Core/lvgl/env_support/pikascript/pika_lvgl_indev_t.su ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_event.cyclo ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_event.d ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_event.o ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_event.su ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_obj.cyclo ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_obj.d ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_obj.o ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_obj.su ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.cyclo ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.d ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.o ./Core/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.su

.PHONY: clean-Core-2f-lvgl-2f-env_support-2f-pikascript

