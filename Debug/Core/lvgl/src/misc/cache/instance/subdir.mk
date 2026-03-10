################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/misc/cache/instance/lv_image_cache.c \
../Core/lvgl/src/misc/cache/instance/lv_image_header_cache.c 

OBJS += \
./Core/lvgl/src/misc/cache/instance/lv_image_cache.o \
./Core/lvgl/src/misc/cache/instance/lv_image_header_cache.o 

C_DEPS += \
./Core/lvgl/src/misc/cache/instance/lv_image_cache.d \
./Core/lvgl/src/misc/cache/instance/lv_image_header_cache.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/misc/cache/instance/%.o Core/lvgl/src/misc/cache/instance/%.su Core/lvgl/src/misc/cache/instance/%.cyclo: ../Core/lvgl/src/misc/cache/instance/%.c Core/lvgl/src/misc/cache/instance/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-misc-2f-cache-2f-instance

clean-Core-2f-lvgl-2f-src-2f-misc-2f-cache-2f-instance:
	-$(RM) ./Core/lvgl/src/misc/cache/instance/lv_image_cache.cyclo ./Core/lvgl/src/misc/cache/instance/lv_image_cache.d ./Core/lvgl/src/misc/cache/instance/lv_image_cache.o ./Core/lvgl/src/misc/cache/instance/lv_image_cache.su ./Core/lvgl/src/misc/cache/instance/lv_image_header_cache.cyclo ./Core/lvgl/src/misc/cache/instance/lv_image_header_cache.d ./Core/lvgl/src/misc/cache/instance/lv_image_header_cache.o ./Core/lvgl/src/misc/cache/instance/lv_image_header_cache.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-misc-2f-cache-2f-instance

