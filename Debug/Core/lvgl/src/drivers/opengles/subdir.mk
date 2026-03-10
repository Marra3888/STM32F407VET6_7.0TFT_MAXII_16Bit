################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/drivers/opengles/lv_opengles_debug.c \
../Core/lvgl/src/drivers/opengles/lv_opengles_driver.c \
../Core/lvgl/src/drivers/opengles/lv_opengles_egl.c \
../Core/lvgl/src/drivers/opengles/lv_opengles_glfw.c \
../Core/lvgl/src/drivers/opengles/lv_opengles_texture.c 

OBJS += \
./Core/lvgl/src/drivers/opengles/lv_opengles_debug.o \
./Core/lvgl/src/drivers/opengles/lv_opengles_driver.o \
./Core/lvgl/src/drivers/opengles/lv_opengles_egl.o \
./Core/lvgl/src/drivers/opengles/lv_opengles_glfw.o \
./Core/lvgl/src/drivers/opengles/lv_opengles_texture.o 

C_DEPS += \
./Core/lvgl/src/drivers/opengles/lv_opengles_debug.d \
./Core/lvgl/src/drivers/opengles/lv_opengles_driver.d \
./Core/lvgl/src/drivers/opengles/lv_opengles_egl.d \
./Core/lvgl/src/drivers/opengles/lv_opengles_glfw.d \
./Core/lvgl/src/drivers/opengles/lv_opengles_texture.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/drivers/opengles/%.o Core/lvgl/src/drivers/opengles/%.su Core/lvgl/src/drivers/opengles/%.cyclo: ../Core/lvgl/src/drivers/opengles/%.c Core/lvgl/src/drivers/opengles/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-opengles

clean-Core-2f-lvgl-2f-src-2f-drivers-2f-opengles:
	-$(RM) ./Core/lvgl/src/drivers/opengles/lv_opengles_debug.cyclo ./Core/lvgl/src/drivers/opengles/lv_opengles_debug.d ./Core/lvgl/src/drivers/opengles/lv_opengles_debug.o ./Core/lvgl/src/drivers/opengles/lv_opengles_debug.su ./Core/lvgl/src/drivers/opengles/lv_opengles_driver.cyclo ./Core/lvgl/src/drivers/opengles/lv_opengles_driver.d ./Core/lvgl/src/drivers/opengles/lv_opengles_driver.o ./Core/lvgl/src/drivers/opengles/lv_opengles_driver.su ./Core/lvgl/src/drivers/opengles/lv_opengles_egl.cyclo ./Core/lvgl/src/drivers/opengles/lv_opengles_egl.d ./Core/lvgl/src/drivers/opengles/lv_opengles_egl.o ./Core/lvgl/src/drivers/opengles/lv_opengles_egl.su ./Core/lvgl/src/drivers/opengles/lv_opengles_glfw.cyclo ./Core/lvgl/src/drivers/opengles/lv_opengles_glfw.d ./Core/lvgl/src/drivers/opengles/lv_opengles_glfw.o ./Core/lvgl/src/drivers/opengles/lv_opengles_glfw.su ./Core/lvgl/src/drivers/opengles/lv_opengles_texture.cyclo ./Core/lvgl/src/drivers/opengles/lv_opengles_texture.d ./Core/lvgl/src/drivers/opengles/lv_opengles_texture.o ./Core/lvgl/src/drivers/opengles/lv_opengles_texture.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-opengles

