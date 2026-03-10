################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/stdlib/builtin/lv_mem_core_builtin.c \
../Core/lvgl/src/stdlib/builtin/lv_sprintf_builtin.c \
../Core/lvgl/src/stdlib/builtin/lv_string_builtin.c \
../Core/lvgl/src/stdlib/builtin/lv_tlsf.c 

OBJS += \
./Core/lvgl/src/stdlib/builtin/lv_mem_core_builtin.o \
./Core/lvgl/src/stdlib/builtin/lv_sprintf_builtin.o \
./Core/lvgl/src/stdlib/builtin/lv_string_builtin.o \
./Core/lvgl/src/stdlib/builtin/lv_tlsf.o 

C_DEPS += \
./Core/lvgl/src/stdlib/builtin/lv_mem_core_builtin.d \
./Core/lvgl/src/stdlib/builtin/lv_sprintf_builtin.d \
./Core/lvgl/src/stdlib/builtin/lv_string_builtin.d \
./Core/lvgl/src/stdlib/builtin/lv_tlsf.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/stdlib/builtin/%.o Core/lvgl/src/stdlib/builtin/%.su Core/lvgl/src/stdlib/builtin/%.cyclo: ../Core/lvgl/src/stdlib/builtin/%.c Core/lvgl/src/stdlib/builtin/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-stdlib-2f-builtin

clean-Core-2f-lvgl-2f-src-2f-stdlib-2f-builtin:
	-$(RM) ./Core/lvgl/src/stdlib/builtin/lv_mem_core_builtin.cyclo ./Core/lvgl/src/stdlib/builtin/lv_mem_core_builtin.d ./Core/lvgl/src/stdlib/builtin/lv_mem_core_builtin.o ./Core/lvgl/src/stdlib/builtin/lv_mem_core_builtin.su ./Core/lvgl/src/stdlib/builtin/lv_sprintf_builtin.cyclo ./Core/lvgl/src/stdlib/builtin/lv_sprintf_builtin.d ./Core/lvgl/src/stdlib/builtin/lv_sprintf_builtin.o ./Core/lvgl/src/stdlib/builtin/lv_sprintf_builtin.su ./Core/lvgl/src/stdlib/builtin/lv_string_builtin.cyclo ./Core/lvgl/src/stdlib/builtin/lv_string_builtin.d ./Core/lvgl/src/stdlib/builtin/lv_string_builtin.o ./Core/lvgl/src/stdlib/builtin/lv_string_builtin.su ./Core/lvgl/src/stdlib/builtin/lv_tlsf.cyclo ./Core/lvgl/src/stdlib/builtin/lv_tlsf.d ./Core/lvgl/src/stdlib/builtin/lv_tlsf.o ./Core/lvgl/src/stdlib/builtin/lv_tlsf.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-stdlib-2f-builtin

