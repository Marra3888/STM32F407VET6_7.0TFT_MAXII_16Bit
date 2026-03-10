################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/libs/ffmpeg/lv_ffmpeg.c 

OBJS += \
./Core/lvgl/src/libs/ffmpeg/lv_ffmpeg.o 

C_DEPS += \
./Core/lvgl/src/libs/ffmpeg/lv_ffmpeg.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/libs/ffmpeg/%.o Core/lvgl/src/libs/ffmpeg/%.su Core/lvgl/src/libs/ffmpeg/%.cyclo: ../Core/lvgl/src/libs/ffmpeg/%.c Core/lvgl/src/libs/ffmpeg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-libs-2f-ffmpeg

clean-Core-2f-lvgl-2f-src-2f-libs-2f-ffmpeg:
	-$(RM) ./Core/lvgl/src/libs/ffmpeg/lv_ffmpeg.cyclo ./Core/lvgl/src/libs/ffmpeg/lv_ffmpeg.d ./Core/lvgl/src/libs/ffmpeg/lv_ffmpeg.o ./Core/lvgl/src/libs/ffmpeg/lv_ffmpeg.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-libs-2f-ffmpeg

