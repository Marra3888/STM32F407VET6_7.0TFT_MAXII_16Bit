################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/demos/widgets/lv_demo_widgets.c \
../Core/lvgl/demos/widgets/lv_demo_widgets_analytics.c \
../Core/lvgl/demos/widgets/lv_demo_widgets_components.c \
../Core/lvgl/demos/widgets/lv_demo_widgets_profile.c \
../Core/lvgl/demos/widgets/lv_demo_widgets_shop.c 

OBJS += \
./Core/lvgl/demos/widgets/lv_demo_widgets.o \
./Core/lvgl/demos/widgets/lv_demo_widgets_analytics.o \
./Core/lvgl/demos/widgets/lv_demo_widgets_components.o \
./Core/lvgl/demos/widgets/lv_demo_widgets_profile.o \
./Core/lvgl/demos/widgets/lv_demo_widgets_shop.o 

C_DEPS += \
./Core/lvgl/demos/widgets/lv_demo_widgets.d \
./Core/lvgl/demos/widgets/lv_demo_widgets_analytics.d \
./Core/lvgl/demos/widgets/lv_demo_widgets_components.d \
./Core/lvgl/demos/widgets/lv_demo_widgets_profile.d \
./Core/lvgl/demos/widgets/lv_demo_widgets_shop.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/demos/widgets/%.o Core/lvgl/demos/widgets/%.su Core/lvgl/demos/widgets/%.cyclo: ../Core/lvgl/demos/widgets/%.c Core/lvgl/demos/widgets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DLV_CONF_INCLUDE_SIMPLE '-Dlvgl.h:' -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-demos-2f-widgets

clean-Core-2f-lvgl-2f-demos-2f-widgets:
	-$(RM) ./Core/lvgl/demos/widgets/lv_demo_widgets.cyclo ./Core/lvgl/demos/widgets/lv_demo_widgets.d ./Core/lvgl/demos/widgets/lv_demo_widgets.o ./Core/lvgl/demos/widgets/lv_demo_widgets.su ./Core/lvgl/demos/widgets/lv_demo_widgets_analytics.cyclo ./Core/lvgl/demos/widgets/lv_demo_widgets_analytics.d ./Core/lvgl/demos/widgets/lv_demo_widgets_analytics.o ./Core/lvgl/demos/widgets/lv_demo_widgets_analytics.su ./Core/lvgl/demos/widgets/lv_demo_widgets_components.cyclo ./Core/lvgl/demos/widgets/lv_demo_widgets_components.d ./Core/lvgl/demos/widgets/lv_demo_widgets_components.o ./Core/lvgl/demos/widgets/lv_demo_widgets_components.su ./Core/lvgl/demos/widgets/lv_demo_widgets_profile.cyclo ./Core/lvgl/demos/widgets/lv_demo_widgets_profile.d ./Core/lvgl/demos/widgets/lv_demo_widgets_profile.o ./Core/lvgl/demos/widgets/lv_demo_widgets_profile.su ./Core/lvgl/demos/widgets/lv_demo_widgets_shop.cyclo ./Core/lvgl/demos/widgets/lv_demo_widgets_shop.d ./Core/lvgl/demos/widgets/lv_demo_widgets_shop.o ./Core/lvgl/demos/widgets/lv_demo_widgets_shop.su

.PHONY: clean-Core-2f-lvgl-2f-demos-2f-widgets

