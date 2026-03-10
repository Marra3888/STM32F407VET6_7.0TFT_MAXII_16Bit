################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/demos/vector_graphic/lv_demo_vector_graphic.c 

OBJS += \
./Core/lvgl/demos/vector_graphic/lv_demo_vector_graphic.o 

C_DEPS += \
./Core/lvgl/demos/vector_graphic/lv_demo_vector_graphic.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/demos/vector_graphic/%.o Core/lvgl/demos/vector_graphic/%.su Core/lvgl/demos/vector_graphic/%.cyclo: ../Core/lvgl/demos/vector_graphic/%.c Core/lvgl/demos/vector_graphic/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-demos-2f-vector_graphic

clean-Core-2f-lvgl-2f-demos-2f-vector_graphic:
	-$(RM) ./Core/lvgl/demos/vector_graphic/lv_demo_vector_graphic.cyclo ./Core/lvgl/demos/vector_graphic/lv_demo_vector_graphic.d ./Core/lvgl/demos/vector_graphic/lv_demo_vector_graphic.o ./Core/lvgl/demos/vector_graphic/lv_demo_vector_graphic.su

.PHONY: clean-Core-2f-lvgl-2f-demos-2f-vector_graphic

