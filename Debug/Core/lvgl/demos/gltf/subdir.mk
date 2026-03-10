################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/demos/gltf/lv_demo_gltf.c 

OBJS += \
./Core/lvgl/demos/gltf/lv_demo_gltf.o 

C_DEPS += \
./Core/lvgl/demos/gltf/lv_demo_gltf.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/demos/gltf/%.o Core/lvgl/demos/gltf/%.su Core/lvgl/demos/gltf/%.cyclo: ../Core/lvgl/demos/gltf/%.c Core/lvgl/demos/gltf/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-demos-2f-gltf

clean-Core-2f-lvgl-2f-demos-2f-gltf:
	-$(RM) ./Core/lvgl/demos/gltf/lv_demo_gltf.cyclo ./Core/lvgl/demos/gltf/lv_demo_gltf.d ./Core/lvgl/demos/gltf/lv_demo_gltf.o ./Core/lvgl/demos/gltf/lv_demo_gltf.su

.PHONY: clean-Core-2f-lvgl-2f-demos-2f-gltf

