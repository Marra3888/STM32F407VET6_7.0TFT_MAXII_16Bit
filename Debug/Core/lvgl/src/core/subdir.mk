################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/core/lv_group.c \
../Core/lvgl/src/core/lv_obj.c \
../Core/lvgl/src/core/lv_obj_class.c \
../Core/lvgl/src/core/lv_obj_draw.c \
../Core/lvgl/src/core/lv_obj_event.c \
../Core/lvgl/src/core/lv_obj_id_builtin.c \
../Core/lvgl/src/core/lv_obj_pos.c \
../Core/lvgl/src/core/lv_obj_property.c \
../Core/lvgl/src/core/lv_obj_scroll.c \
../Core/lvgl/src/core/lv_obj_style.c \
../Core/lvgl/src/core/lv_obj_style_gen.c \
../Core/lvgl/src/core/lv_obj_tree.c \
../Core/lvgl/src/core/lv_observer.c \
../Core/lvgl/src/core/lv_refr.c 

OBJS += \
./Core/lvgl/src/core/lv_group.o \
./Core/lvgl/src/core/lv_obj.o \
./Core/lvgl/src/core/lv_obj_class.o \
./Core/lvgl/src/core/lv_obj_draw.o \
./Core/lvgl/src/core/lv_obj_event.o \
./Core/lvgl/src/core/lv_obj_id_builtin.o \
./Core/lvgl/src/core/lv_obj_pos.o \
./Core/lvgl/src/core/lv_obj_property.o \
./Core/lvgl/src/core/lv_obj_scroll.o \
./Core/lvgl/src/core/lv_obj_style.o \
./Core/lvgl/src/core/lv_obj_style_gen.o \
./Core/lvgl/src/core/lv_obj_tree.o \
./Core/lvgl/src/core/lv_observer.o \
./Core/lvgl/src/core/lv_refr.o 

C_DEPS += \
./Core/lvgl/src/core/lv_group.d \
./Core/lvgl/src/core/lv_obj.d \
./Core/lvgl/src/core/lv_obj_class.d \
./Core/lvgl/src/core/lv_obj_draw.d \
./Core/lvgl/src/core/lv_obj_event.d \
./Core/lvgl/src/core/lv_obj_id_builtin.d \
./Core/lvgl/src/core/lv_obj_pos.d \
./Core/lvgl/src/core/lv_obj_property.d \
./Core/lvgl/src/core/lv_obj_scroll.d \
./Core/lvgl/src/core/lv_obj_style.d \
./Core/lvgl/src/core/lv_obj_style_gen.d \
./Core/lvgl/src/core/lv_obj_tree.d \
./Core/lvgl/src/core/lv_observer.d \
./Core/lvgl/src/core/lv_refr.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/core/%.o Core/lvgl/src/core/%.su Core/lvgl/src/core/%.cyclo: ../Core/lvgl/src/core/%.c Core/lvgl/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-core

clean-Core-2f-lvgl-2f-src-2f-core:
	-$(RM) ./Core/lvgl/src/core/lv_group.cyclo ./Core/lvgl/src/core/lv_group.d ./Core/lvgl/src/core/lv_group.o ./Core/lvgl/src/core/lv_group.su ./Core/lvgl/src/core/lv_obj.cyclo ./Core/lvgl/src/core/lv_obj.d ./Core/lvgl/src/core/lv_obj.o ./Core/lvgl/src/core/lv_obj.su ./Core/lvgl/src/core/lv_obj_class.cyclo ./Core/lvgl/src/core/lv_obj_class.d ./Core/lvgl/src/core/lv_obj_class.o ./Core/lvgl/src/core/lv_obj_class.su ./Core/lvgl/src/core/lv_obj_draw.cyclo ./Core/lvgl/src/core/lv_obj_draw.d ./Core/lvgl/src/core/lv_obj_draw.o ./Core/lvgl/src/core/lv_obj_draw.su ./Core/lvgl/src/core/lv_obj_event.cyclo ./Core/lvgl/src/core/lv_obj_event.d ./Core/lvgl/src/core/lv_obj_event.o ./Core/lvgl/src/core/lv_obj_event.su ./Core/lvgl/src/core/lv_obj_id_builtin.cyclo ./Core/lvgl/src/core/lv_obj_id_builtin.d ./Core/lvgl/src/core/lv_obj_id_builtin.o ./Core/lvgl/src/core/lv_obj_id_builtin.su ./Core/lvgl/src/core/lv_obj_pos.cyclo ./Core/lvgl/src/core/lv_obj_pos.d ./Core/lvgl/src/core/lv_obj_pos.o ./Core/lvgl/src/core/lv_obj_pos.su ./Core/lvgl/src/core/lv_obj_property.cyclo ./Core/lvgl/src/core/lv_obj_property.d ./Core/lvgl/src/core/lv_obj_property.o ./Core/lvgl/src/core/lv_obj_property.su ./Core/lvgl/src/core/lv_obj_scroll.cyclo ./Core/lvgl/src/core/lv_obj_scroll.d ./Core/lvgl/src/core/lv_obj_scroll.o ./Core/lvgl/src/core/lv_obj_scroll.su ./Core/lvgl/src/core/lv_obj_style.cyclo ./Core/lvgl/src/core/lv_obj_style.d ./Core/lvgl/src/core/lv_obj_style.o ./Core/lvgl/src/core/lv_obj_style.su ./Core/lvgl/src/core/lv_obj_style_gen.cyclo ./Core/lvgl/src/core/lv_obj_style_gen.d ./Core/lvgl/src/core/lv_obj_style_gen.o ./Core/lvgl/src/core/lv_obj_style_gen.su ./Core/lvgl/src/core/lv_obj_tree.cyclo ./Core/lvgl/src/core/lv_obj_tree.d ./Core/lvgl/src/core/lv_obj_tree.o ./Core/lvgl/src/core/lv_obj_tree.su ./Core/lvgl/src/core/lv_observer.cyclo ./Core/lvgl/src/core/lv_observer.d ./Core/lvgl/src/core/lv_observer.o ./Core/lvgl/src/core/lv_observer.su ./Core/lvgl/src/core/lv_refr.cyclo ./Core/lvgl/src/core/lv_refr.d ./Core/lvgl/src/core/lv_refr.o ./Core/lvgl/src/core/lv_refr.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-core

