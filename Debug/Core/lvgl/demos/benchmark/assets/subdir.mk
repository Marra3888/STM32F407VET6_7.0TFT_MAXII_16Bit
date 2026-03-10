################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/demos/benchmark/assets/img_benchmark_avatar.c \
../Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.c \
../Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.c \
../Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.c \
../Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.c \
../Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.c \
../Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.c \
../Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.c \
../Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.c \
../Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.c 

OBJS += \
./Core/lvgl/demos/benchmark/assets/img_benchmark_avatar.o \
./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.o \
./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.o \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.o \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.o \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.o \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.o \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.o \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.o \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.o 

C_DEPS += \
./Core/lvgl/demos/benchmark/assets/img_benchmark_avatar.d \
./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.d \
./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.d \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.d \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.d \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.d \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.d \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.d \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.d \
./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/demos/benchmark/assets/%.o Core/lvgl/demos/benchmark/assets/%.su Core/lvgl/demos/benchmark/assets/%.cyclo: ../Core/lvgl/demos/benchmark/assets/%.c Core/lvgl/demos/benchmark/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-demos-2f-benchmark-2f-assets

clean-Core-2f-lvgl-2f-demos-2f-benchmark-2f-assets:
	-$(RM) ./Core/lvgl/demos/benchmark/assets/img_benchmark_avatar.cyclo ./Core/lvgl/demos/benchmark/assets/img_benchmark_avatar.d ./Core/lvgl/demos/benchmark/assets/img_benchmark_avatar.o ./Core/lvgl/demos/benchmark/assets/img_benchmark_avatar.su ./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.cyclo ./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.d ./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.o ./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.su ./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.cyclo ./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.d ./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.o ./Core/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.su ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.cyclo ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.d ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.o ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.su ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.cyclo ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.d ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.o ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.su ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.cyclo ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.d ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.o ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.su ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.cyclo ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.d ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.o ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.su ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.cyclo ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.d ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.o ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.su ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.cyclo ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.d ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.o ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.su ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.cyclo ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.d ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.o ./Core/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.su

.PHONY: clean-Core-2f-lvgl-2f-demos-2f-benchmark-2f-assets

