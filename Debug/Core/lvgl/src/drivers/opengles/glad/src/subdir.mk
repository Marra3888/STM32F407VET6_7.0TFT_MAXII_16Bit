################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/drivers/opengles/glad/src/egl.c \
../Core/lvgl/src/drivers/opengles/glad/src/gl.c \
../Core/lvgl/src/drivers/opengles/glad/src/gles2.c 

OBJS += \
./Core/lvgl/src/drivers/opengles/glad/src/egl.o \
./Core/lvgl/src/drivers/opengles/glad/src/gl.o \
./Core/lvgl/src/drivers/opengles/glad/src/gles2.o 

C_DEPS += \
./Core/lvgl/src/drivers/opengles/glad/src/egl.d \
./Core/lvgl/src/drivers/opengles/glad/src/gl.d \
./Core/lvgl/src/drivers/opengles/glad/src/gles2.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/drivers/opengles/glad/src/%.o Core/lvgl/src/drivers/opengles/glad/src/%.su Core/lvgl/src/drivers/opengles/glad/src/%.cyclo: ../Core/lvgl/src/drivers/opengles/glad/src/%.c Core/lvgl/src/drivers/opengles/glad/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-glad-2f-src

clean-Core-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-glad-2f-src:
	-$(RM) ./Core/lvgl/src/drivers/opengles/glad/src/egl.cyclo ./Core/lvgl/src/drivers/opengles/glad/src/egl.d ./Core/lvgl/src/drivers/opengles/glad/src/egl.o ./Core/lvgl/src/drivers/opengles/glad/src/egl.su ./Core/lvgl/src/drivers/opengles/glad/src/gl.cyclo ./Core/lvgl/src/drivers/opengles/glad/src/gl.d ./Core/lvgl/src/drivers/opengles/glad/src/gl.o ./Core/lvgl/src/drivers/opengles/glad/src/gl.su ./Core/lvgl/src/drivers/opengles/glad/src/gles2.cyclo ./Core/lvgl/src/drivers/opengles/glad/src/gles2.d ./Core/lvgl/src/drivers/opengles/glad/src/gles2.o ./Core/lvgl/src/drivers/opengles/glad/src/gles2.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-glad-2f-src

