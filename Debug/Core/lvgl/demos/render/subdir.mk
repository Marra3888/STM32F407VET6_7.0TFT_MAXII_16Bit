################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/demos/render/lv_demo_render.c 

OBJS += \
./Core/lvgl/demos/render/lv_demo_render.o 

C_DEPS += \
./Core/lvgl/demos/render/lv_demo_render.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/demos/render/%.o Core/lvgl/demos/render/%.su Core/lvgl/demos/render/%.cyclo: ../Core/lvgl/demos/render/%.c Core/lvgl/demos/render/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-demos-2f-render

clean-Core-2f-lvgl-2f-demos-2f-render:
	-$(RM) ./Core/lvgl/demos/render/lv_demo_render.cyclo ./Core/lvgl/demos/render/lv_demo_render.d ./Core/lvgl/demos/render/lv_demo_render.o ./Core/lvgl/demos/render/lv_demo_render.su

.PHONY: clean-Core-2f-lvgl-2f-demos-2f-render

