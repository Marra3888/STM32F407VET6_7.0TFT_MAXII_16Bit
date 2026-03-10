################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/demos/music/lv_demo_music.c \
../Core/lvgl/demos/music/lv_demo_music_list.c \
../Core/lvgl/demos/music/lv_demo_music_main.c 

OBJS += \
./Core/lvgl/demos/music/lv_demo_music.o \
./Core/lvgl/demos/music/lv_demo_music_list.o \
./Core/lvgl/demos/music/lv_demo_music_main.o 

C_DEPS += \
./Core/lvgl/demos/music/lv_demo_music.d \
./Core/lvgl/demos/music/lv_demo_music_list.d \
./Core/lvgl/demos/music/lv_demo_music_main.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/demos/music/%.o Core/lvgl/demos/music/%.su Core/lvgl/demos/music/%.cyclo: ../Core/lvgl/demos/music/%.c Core/lvgl/demos/music/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-demos-2f-music

clean-Core-2f-lvgl-2f-demos-2f-music:
	-$(RM) ./Core/lvgl/demos/music/lv_demo_music.cyclo ./Core/lvgl/demos/music/lv_demo_music.d ./Core/lvgl/demos/music/lv_demo_music.o ./Core/lvgl/demos/music/lv_demo_music.su ./Core/lvgl/demos/music/lv_demo_music_list.cyclo ./Core/lvgl/demos/music/lv_demo_music_list.d ./Core/lvgl/demos/music/lv_demo_music_list.o ./Core/lvgl/demos/music/lv_demo_music_list.su ./Core/lvgl/demos/music/lv_demo_music_main.cyclo ./Core/lvgl/demos/music/lv_demo_music_main.d ./Core/lvgl/demos/music/lv_demo_music_main.o ./Core/lvgl/demos/music/lv_demo_music_main.su

.PHONY: clean-Core-2f-lvgl-2f-demos-2f-music

