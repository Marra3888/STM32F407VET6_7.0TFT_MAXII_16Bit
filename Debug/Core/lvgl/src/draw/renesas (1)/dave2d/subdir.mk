################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.c \
../Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.c \
../Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.c \
../Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.c \
../Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.c \
../Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.c \
../Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.c \
../Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.c \
../Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.c \
../Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.c 

OBJS += \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o 

C_DEPS += \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d \
./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/draw/renesas/dave2d/%.o Core/lvgl/src/draw/renesas/dave2d/%.su Core/lvgl/src/draw/renesas/dave2d/%.cyclo: ../Core/lvgl/src/draw/renesas/dave2d/%.c Core/lvgl/src/draw/renesas/dave2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d

clean-Core-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d:
	-$(RM) ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.cyclo ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.su ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.cyclo ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.su ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.cyclo ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.su ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.cyclo ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.su ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.cyclo ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.su ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.cyclo ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.su ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.cyclo ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.su ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.cyclo ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.su ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.cyclo ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.su ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.cyclo ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o ./Core/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d

