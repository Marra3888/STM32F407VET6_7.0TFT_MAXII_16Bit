################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/misc/cache/class/lv_cache_lru_ll.c \
../Core/lvgl/src/misc/cache/class/lv_cache_lru_rb.c \
../Core/lvgl/src/misc/cache/class/lv_cache_sc_da.c 

OBJS += \
./Core/lvgl/src/misc/cache/class/lv_cache_lru_ll.o \
./Core/lvgl/src/misc/cache/class/lv_cache_lru_rb.o \
./Core/lvgl/src/misc/cache/class/lv_cache_sc_da.o 

C_DEPS += \
./Core/lvgl/src/misc/cache/class/lv_cache_lru_ll.d \
./Core/lvgl/src/misc/cache/class/lv_cache_lru_rb.d \
./Core/lvgl/src/misc/cache/class/lv_cache_sc_da.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/misc/cache/class/%.o Core/lvgl/src/misc/cache/class/%.su Core/lvgl/src/misc/cache/class/%.cyclo: ../Core/lvgl/src/misc/cache/class/%.c Core/lvgl/src/misc/cache/class/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-misc-2f-cache-2f-class

clean-Core-2f-lvgl-2f-src-2f-misc-2f-cache-2f-class:
	-$(RM) ./Core/lvgl/src/misc/cache/class/lv_cache_lru_ll.cyclo ./Core/lvgl/src/misc/cache/class/lv_cache_lru_ll.d ./Core/lvgl/src/misc/cache/class/lv_cache_lru_ll.o ./Core/lvgl/src/misc/cache/class/lv_cache_lru_ll.su ./Core/lvgl/src/misc/cache/class/lv_cache_lru_rb.cyclo ./Core/lvgl/src/misc/cache/class/lv_cache_lru_rb.d ./Core/lvgl/src/misc/cache/class/lv_cache_lru_rb.o ./Core/lvgl/src/misc/cache/class/lv_cache_lru_rb.su ./Core/lvgl/src/misc/cache/class/lv_cache_sc_da.cyclo ./Core/lvgl/src/misc/cache/class/lv_cache_sc_da.d ./Core/lvgl/src/misc/cache/class/lv_cache_sc_da.o ./Core/lvgl/src/misc/cache/class/lv_cache_sc_da.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-misc-2f-cache-2f-class

