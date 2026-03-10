################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/drivers/sdl/lv_sdl_egl.c \
../Core/lvgl/src/drivers/sdl/lv_sdl_keyboard.c \
../Core/lvgl/src/drivers/sdl/lv_sdl_mouse.c \
../Core/lvgl/src/drivers/sdl/lv_sdl_mousewheel.c \
../Core/lvgl/src/drivers/sdl/lv_sdl_sw.c \
../Core/lvgl/src/drivers/sdl/lv_sdl_texture.c \
../Core/lvgl/src/drivers/sdl/lv_sdl_window.c 

OBJS += \
./Core/lvgl/src/drivers/sdl/lv_sdl_egl.o \
./Core/lvgl/src/drivers/sdl/lv_sdl_keyboard.o \
./Core/lvgl/src/drivers/sdl/lv_sdl_mouse.o \
./Core/lvgl/src/drivers/sdl/lv_sdl_mousewheel.o \
./Core/lvgl/src/drivers/sdl/lv_sdl_sw.o \
./Core/lvgl/src/drivers/sdl/lv_sdl_texture.o \
./Core/lvgl/src/drivers/sdl/lv_sdl_window.o 

C_DEPS += \
./Core/lvgl/src/drivers/sdl/lv_sdl_egl.d \
./Core/lvgl/src/drivers/sdl/lv_sdl_keyboard.d \
./Core/lvgl/src/drivers/sdl/lv_sdl_mouse.d \
./Core/lvgl/src/drivers/sdl/lv_sdl_mousewheel.d \
./Core/lvgl/src/drivers/sdl/lv_sdl_sw.d \
./Core/lvgl/src/drivers/sdl/lv_sdl_texture.d \
./Core/lvgl/src/drivers/sdl/lv_sdl_window.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/drivers/sdl/%.o Core/lvgl/src/drivers/sdl/%.su Core/lvgl/src/drivers/sdl/%.cyclo: ../Core/lvgl/src/drivers/sdl/%.c Core/lvgl/src/drivers/sdl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-sdl

clean-Core-2f-lvgl-2f-src-2f-drivers-2f-sdl:
	-$(RM) ./Core/lvgl/src/drivers/sdl/lv_sdl_egl.cyclo ./Core/lvgl/src/drivers/sdl/lv_sdl_egl.d ./Core/lvgl/src/drivers/sdl/lv_sdl_egl.o ./Core/lvgl/src/drivers/sdl/lv_sdl_egl.su ./Core/lvgl/src/drivers/sdl/lv_sdl_keyboard.cyclo ./Core/lvgl/src/drivers/sdl/lv_sdl_keyboard.d ./Core/lvgl/src/drivers/sdl/lv_sdl_keyboard.o ./Core/lvgl/src/drivers/sdl/lv_sdl_keyboard.su ./Core/lvgl/src/drivers/sdl/lv_sdl_mouse.cyclo ./Core/lvgl/src/drivers/sdl/lv_sdl_mouse.d ./Core/lvgl/src/drivers/sdl/lv_sdl_mouse.o ./Core/lvgl/src/drivers/sdl/lv_sdl_mouse.su ./Core/lvgl/src/drivers/sdl/lv_sdl_mousewheel.cyclo ./Core/lvgl/src/drivers/sdl/lv_sdl_mousewheel.d ./Core/lvgl/src/drivers/sdl/lv_sdl_mousewheel.o ./Core/lvgl/src/drivers/sdl/lv_sdl_mousewheel.su ./Core/lvgl/src/drivers/sdl/lv_sdl_sw.cyclo ./Core/lvgl/src/drivers/sdl/lv_sdl_sw.d ./Core/lvgl/src/drivers/sdl/lv_sdl_sw.o ./Core/lvgl/src/drivers/sdl/lv_sdl_sw.su ./Core/lvgl/src/drivers/sdl/lv_sdl_texture.cyclo ./Core/lvgl/src/drivers/sdl/lv_sdl_texture.d ./Core/lvgl/src/drivers/sdl/lv_sdl_texture.o ./Core/lvgl/src/drivers/sdl/lv_sdl_texture.su ./Core/lvgl/src/drivers/sdl/lv_sdl_window.cyclo ./Core/lvgl/src/drivers/sdl/lv_sdl_window.d ./Core/lvgl/src/drivers/sdl/lv_sdl_window.o ./Core/lvgl/src/drivers/sdl/lv_sdl_window.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-sdl

