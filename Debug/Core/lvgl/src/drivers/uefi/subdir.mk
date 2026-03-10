################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/drivers/uefi/lv_uefi_context.c \
../Core/lvgl/src/drivers/uefi/lv_uefi_display.c \
../Core/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.c \
../Core/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.c \
../Core/lvgl/src/drivers/uefi/lv_uefi_indev_touch.c \
../Core/lvgl/src/drivers/uefi/lv_uefi_private.c 

OBJS += \
./Core/lvgl/src/drivers/uefi/lv_uefi_context.o \
./Core/lvgl/src/drivers/uefi/lv_uefi_display.o \
./Core/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.o \
./Core/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.o \
./Core/lvgl/src/drivers/uefi/lv_uefi_indev_touch.o \
./Core/lvgl/src/drivers/uefi/lv_uefi_private.o 

C_DEPS += \
./Core/lvgl/src/drivers/uefi/lv_uefi_context.d \
./Core/lvgl/src/drivers/uefi/lv_uefi_display.d \
./Core/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.d \
./Core/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.d \
./Core/lvgl/src/drivers/uefi/lv_uefi_indev_touch.d \
./Core/lvgl/src/drivers/uefi/lv_uefi_private.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/drivers/uefi/%.o Core/lvgl/src/drivers/uefi/%.su Core/lvgl/src/drivers/uefi/%.cyclo: ../Core/lvgl/src/drivers/uefi/%.c Core/lvgl/src/drivers/uefi/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-uefi

clean-Core-2f-lvgl-2f-src-2f-drivers-2f-uefi:
	-$(RM) ./Core/lvgl/src/drivers/uefi/lv_uefi_context.cyclo ./Core/lvgl/src/drivers/uefi/lv_uefi_context.d ./Core/lvgl/src/drivers/uefi/lv_uefi_context.o ./Core/lvgl/src/drivers/uefi/lv_uefi_context.su ./Core/lvgl/src/drivers/uefi/lv_uefi_display.cyclo ./Core/lvgl/src/drivers/uefi/lv_uefi_display.d ./Core/lvgl/src/drivers/uefi/lv_uefi_display.o ./Core/lvgl/src/drivers/uefi/lv_uefi_display.su ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.cyclo ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.d ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.o ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.su ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.cyclo ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.d ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.o ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.su ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_touch.cyclo ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_touch.d ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_touch.o ./Core/lvgl/src/drivers/uefi/lv_uefi_indev_touch.su ./Core/lvgl/src/drivers/uefi/lv_uefi_private.cyclo ./Core/lvgl/src/drivers/uefi/lv_uefi_private.d ./Core/lvgl/src/drivers/uefi/lv_uefi_private.o ./Core/lvgl/src/drivers/uefi/lv_uefi_private.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-uefi

