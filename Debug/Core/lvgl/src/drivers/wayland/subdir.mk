################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/drivers/wayland/lv_wayland.c \
../Core/lvgl/src/drivers/wayland/lv_wl_egl_backend.c \
../Core/lvgl/src/drivers/wayland/lv_wl_g2d_backend.c \
../Core/lvgl/src/drivers/wayland/lv_wl_keyboard.c \
../Core/lvgl/src/drivers/wayland/lv_wl_pointer.c \
../Core/lvgl/src/drivers/wayland/lv_wl_seat.c \
../Core/lvgl/src/drivers/wayland/lv_wl_shm_backend.c \
../Core/lvgl/src/drivers/wayland/lv_wl_touch.c \
../Core/lvgl/src/drivers/wayland/lv_wl_window.c \
../Core/lvgl/src/drivers/wayland/lv_wl_xdg_shell.c 

OBJS += \
./Core/lvgl/src/drivers/wayland/lv_wayland.o \
./Core/lvgl/src/drivers/wayland/lv_wl_egl_backend.o \
./Core/lvgl/src/drivers/wayland/lv_wl_g2d_backend.o \
./Core/lvgl/src/drivers/wayland/lv_wl_keyboard.o \
./Core/lvgl/src/drivers/wayland/lv_wl_pointer.o \
./Core/lvgl/src/drivers/wayland/lv_wl_seat.o \
./Core/lvgl/src/drivers/wayland/lv_wl_shm_backend.o \
./Core/lvgl/src/drivers/wayland/lv_wl_touch.o \
./Core/lvgl/src/drivers/wayland/lv_wl_window.o \
./Core/lvgl/src/drivers/wayland/lv_wl_xdg_shell.o 

C_DEPS += \
./Core/lvgl/src/drivers/wayland/lv_wayland.d \
./Core/lvgl/src/drivers/wayland/lv_wl_egl_backend.d \
./Core/lvgl/src/drivers/wayland/lv_wl_g2d_backend.d \
./Core/lvgl/src/drivers/wayland/lv_wl_keyboard.d \
./Core/lvgl/src/drivers/wayland/lv_wl_pointer.d \
./Core/lvgl/src/drivers/wayland/lv_wl_seat.d \
./Core/lvgl/src/drivers/wayland/lv_wl_shm_backend.d \
./Core/lvgl/src/drivers/wayland/lv_wl_touch.d \
./Core/lvgl/src/drivers/wayland/lv_wl_window.d \
./Core/lvgl/src/drivers/wayland/lv_wl_xdg_shell.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/drivers/wayland/%.o Core/lvgl/src/drivers/wayland/%.su Core/lvgl/src/drivers/wayland/%.cyclo: ../Core/lvgl/src/drivers/wayland/%.c Core/lvgl/src/drivers/wayland/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-wayland

clean-Core-2f-lvgl-2f-src-2f-drivers-2f-wayland:
	-$(RM) ./Core/lvgl/src/drivers/wayland/lv_wayland.cyclo ./Core/lvgl/src/drivers/wayland/lv_wayland.d ./Core/lvgl/src/drivers/wayland/lv_wayland.o ./Core/lvgl/src/drivers/wayland/lv_wayland.su ./Core/lvgl/src/drivers/wayland/lv_wl_egl_backend.cyclo ./Core/lvgl/src/drivers/wayland/lv_wl_egl_backend.d ./Core/lvgl/src/drivers/wayland/lv_wl_egl_backend.o ./Core/lvgl/src/drivers/wayland/lv_wl_egl_backend.su ./Core/lvgl/src/drivers/wayland/lv_wl_g2d_backend.cyclo ./Core/lvgl/src/drivers/wayland/lv_wl_g2d_backend.d ./Core/lvgl/src/drivers/wayland/lv_wl_g2d_backend.o ./Core/lvgl/src/drivers/wayland/lv_wl_g2d_backend.su ./Core/lvgl/src/drivers/wayland/lv_wl_keyboard.cyclo ./Core/lvgl/src/drivers/wayland/lv_wl_keyboard.d ./Core/lvgl/src/drivers/wayland/lv_wl_keyboard.o ./Core/lvgl/src/drivers/wayland/lv_wl_keyboard.su ./Core/lvgl/src/drivers/wayland/lv_wl_pointer.cyclo ./Core/lvgl/src/drivers/wayland/lv_wl_pointer.d ./Core/lvgl/src/drivers/wayland/lv_wl_pointer.o ./Core/lvgl/src/drivers/wayland/lv_wl_pointer.su ./Core/lvgl/src/drivers/wayland/lv_wl_seat.cyclo ./Core/lvgl/src/drivers/wayland/lv_wl_seat.d ./Core/lvgl/src/drivers/wayland/lv_wl_seat.o ./Core/lvgl/src/drivers/wayland/lv_wl_seat.su ./Core/lvgl/src/drivers/wayland/lv_wl_shm_backend.cyclo ./Core/lvgl/src/drivers/wayland/lv_wl_shm_backend.d ./Core/lvgl/src/drivers/wayland/lv_wl_shm_backend.o ./Core/lvgl/src/drivers/wayland/lv_wl_shm_backend.su ./Core/lvgl/src/drivers/wayland/lv_wl_touch.cyclo ./Core/lvgl/src/drivers/wayland/lv_wl_touch.d ./Core/lvgl/src/drivers/wayland/lv_wl_touch.o ./Core/lvgl/src/drivers/wayland/lv_wl_touch.su ./Core/lvgl/src/drivers/wayland/lv_wl_window.cyclo ./Core/lvgl/src/drivers/wayland/lv_wl_window.d ./Core/lvgl/src/drivers/wayland/lv_wl_window.o ./Core/lvgl/src/drivers/wayland/lv_wl_window.su ./Core/lvgl/src/drivers/wayland/lv_wl_xdg_shell.cyclo ./Core/lvgl/src/drivers/wayland/lv_wl_xdg_shell.d ./Core/lvgl/src/drivers/wayland/lv_wl_xdg_shell.o ./Core/lvgl/src/drivers/wayland/lv_wl_xdg_shell.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-wayland

