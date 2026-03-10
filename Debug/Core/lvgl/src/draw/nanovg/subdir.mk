################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_border.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_image.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_label.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_line.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.c \
../Core/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.c \
../Core/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.c \
../Core/lvgl/src/draw/nanovg/lv_nanovg_image_cache.c \
../Core/lvgl/src/draw/nanovg/lv_nanovg_utils.c 

OBJS += \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_border.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_image.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_label.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_line.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.o \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.o \
./Core/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.o \
./Core/lvgl/src/draw/nanovg/lv_nanovg_image_cache.o \
./Core/lvgl/src/draw/nanovg/lv_nanovg_utils.o 

C_DEPS += \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_border.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_image.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_label.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_line.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.d \
./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.d \
./Core/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.d \
./Core/lvgl/src/draw/nanovg/lv_nanovg_image_cache.d \
./Core/lvgl/src/draw/nanovg/lv_nanovg_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/draw/nanovg/%.o Core/lvgl/src/draw/nanovg/%.su Core/lvgl/src/draw/nanovg/%.cyclo: ../Core/lvgl/src/draw/nanovg/%.c Core/lvgl/src/draw/nanovg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-draw-2f-nanovg

clean-Core-2f-lvgl-2f-src-2f-draw-2f-nanovg:
	-$(RM) ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_3d.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_arc.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_border.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_border.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_border.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_border.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_box_shadow.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_fill.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_grad.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_image.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_image.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_image.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_image.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_label.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_label.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_label.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_label.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_layer.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_line.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_line.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_line.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_line.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_mask_rect.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_triangle.su ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.cyclo ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.d ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.o ./Core/lvgl/src/draw/nanovg/lv_draw_nanovg_vector.su ./Core/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.cyclo ./Core/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.d ./Core/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.o ./Core/lvgl/src/draw/nanovg/lv_nanovg_fbo_cache.su ./Core/lvgl/src/draw/nanovg/lv_nanovg_image_cache.cyclo ./Core/lvgl/src/draw/nanovg/lv_nanovg_image_cache.d ./Core/lvgl/src/draw/nanovg/lv_nanovg_image_cache.o ./Core/lvgl/src/draw/nanovg/lv_nanovg_image_cache.su ./Core/lvgl/src/draw/nanovg/lv_nanovg_utils.cyclo ./Core/lvgl/src/draw/nanovg/lv_nanovg_utils.d ./Core/lvgl/src/draw/nanovg/lv_nanovg_utils.o ./Core/lvgl/src/draw/nanovg/lv_nanovg_utils.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-draw-2f-nanovg

