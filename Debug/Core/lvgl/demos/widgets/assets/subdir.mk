################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/demos/widgets/assets/img_clothes.c \
../Core/lvgl/demos/widgets/assets/img_demo_widgets_avatar.c \
../Core/lvgl/demos/widgets/assets/img_demo_widgets_needle.c \
../Core/lvgl/demos/widgets/assets/img_lvgl_logo.c 

OBJS += \
./Core/lvgl/demos/widgets/assets/img_clothes.o \
./Core/lvgl/demos/widgets/assets/img_demo_widgets_avatar.o \
./Core/lvgl/demos/widgets/assets/img_demo_widgets_needle.o \
./Core/lvgl/demos/widgets/assets/img_lvgl_logo.o 

C_DEPS += \
./Core/lvgl/demos/widgets/assets/img_clothes.d \
./Core/lvgl/demos/widgets/assets/img_demo_widgets_avatar.d \
./Core/lvgl/demos/widgets/assets/img_demo_widgets_needle.d \
./Core/lvgl/demos/widgets/assets/img_lvgl_logo.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/demos/widgets/assets/%.o Core/lvgl/demos/widgets/assets/%.su Core/lvgl/demos/widgets/assets/%.cyclo: ../Core/lvgl/demos/widgets/assets/%.c Core/lvgl/demos/widgets/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-demos-2f-widgets-2f-assets

clean-Core-2f-lvgl-2f-demos-2f-widgets-2f-assets:
	-$(RM) ./Core/lvgl/demos/widgets/assets/img_clothes.cyclo ./Core/lvgl/demos/widgets/assets/img_clothes.d ./Core/lvgl/demos/widgets/assets/img_clothes.o ./Core/lvgl/demos/widgets/assets/img_clothes.su ./Core/lvgl/demos/widgets/assets/img_demo_widgets_avatar.cyclo ./Core/lvgl/demos/widgets/assets/img_demo_widgets_avatar.d ./Core/lvgl/demos/widgets/assets/img_demo_widgets_avatar.o ./Core/lvgl/demos/widgets/assets/img_demo_widgets_avatar.su ./Core/lvgl/demos/widgets/assets/img_demo_widgets_needle.cyclo ./Core/lvgl/demos/widgets/assets/img_demo_widgets_needle.d ./Core/lvgl/demos/widgets/assets/img_demo_widgets_needle.o ./Core/lvgl/demos/widgets/assets/img_demo_widgets_needle.su ./Core/lvgl/demos/widgets/assets/img_lvgl_logo.cyclo ./Core/lvgl/demos/widgets/assets/img_lvgl_logo.d ./Core/lvgl/demos/widgets/assets/img_lvgl_logo.o ./Core/lvgl/demos/widgets/assets/img_lvgl_logo.su

.PHONY: clean-Core-2f-lvgl-2f-demos-2f-widgets-2f-assets

