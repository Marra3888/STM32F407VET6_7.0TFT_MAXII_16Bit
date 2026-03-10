################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/indev/lv_gridnav.c \
../Core/lvgl/src/indev/lv_indev.c \
../Core/lvgl/src/indev/lv_indev_gesture.c \
../Core/lvgl/src/indev/lv_indev_scroll.c 

OBJS += \
./Core/lvgl/src/indev/lv_gridnav.o \
./Core/lvgl/src/indev/lv_indev.o \
./Core/lvgl/src/indev/lv_indev_gesture.o \
./Core/lvgl/src/indev/lv_indev_scroll.o 

C_DEPS += \
./Core/lvgl/src/indev/lv_gridnav.d \
./Core/lvgl/src/indev/lv_indev.d \
./Core/lvgl/src/indev/lv_indev_gesture.d \
./Core/lvgl/src/indev/lv_indev_scroll.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/indev/%.o Core/lvgl/src/indev/%.su Core/lvgl/src/indev/%.cyclo: ../Core/lvgl/src/indev/%.c Core/lvgl/src/indev/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-indev

clean-Core-2f-lvgl-2f-src-2f-indev:
	-$(RM) ./Core/lvgl/src/indev/lv_gridnav.cyclo ./Core/lvgl/src/indev/lv_gridnav.d ./Core/lvgl/src/indev/lv_gridnav.o ./Core/lvgl/src/indev/lv_gridnav.su ./Core/lvgl/src/indev/lv_indev.cyclo ./Core/lvgl/src/indev/lv_indev.d ./Core/lvgl/src/indev/lv_indev.o ./Core/lvgl/src/indev/lv_indev.su ./Core/lvgl/src/indev/lv_indev_gesture.cyclo ./Core/lvgl/src/indev/lv_indev_gesture.d ./Core/lvgl/src/indev/lv_indev_gesture.o ./Core/lvgl/src/indev/lv_indev_gesture.su ./Core/lvgl/src/indev/lv_indev_scroll.cyclo ./Core/lvgl/src/indev/lv_indev_scroll.d ./Core/lvgl/src/indev/lv_indev_scroll.o ./Core/lvgl/src/indev/lv_indev_scroll.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-indev

