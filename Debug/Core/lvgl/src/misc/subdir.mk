################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/misc/lv_anim.c \
../Core/lvgl/src/misc/lv_anim_timeline.c \
../Core/lvgl/src/misc/lv_area.c \
../Core/lvgl/src/misc/lv_array.c \
../Core/lvgl/src/misc/lv_async.c \
../Core/lvgl/src/misc/lv_bidi.c \
../Core/lvgl/src/misc/lv_circle_buf.c \
../Core/lvgl/src/misc/lv_color.c \
../Core/lvgl/src/misc/lv_color_op.c \
../Core/lvgl/src/misc/lv_event.c \
../Core/lvgl/src/misc/lv_fs.c \
../Core/lvgl/src/misc/lv_grad.c \
../Core/lvgl/src/misc/lv_iter.c \
../Core/lvgl/src/misc/lv_ll.c \
../Core/lvgl/src/misc/lv_log.c \
../Core/lvgl/src/misc/lv_lru.c \
../Core/lvgl/src/misc/lv_math.c \
../Core/lvgl/src/misc/lv_matrix.c \
../Core/lvgl/src/misc/lv_palette.c \
../Core/lvgl/src/misc/lv_pending.c \
../Core/lvgl/src/misc/lv_profiler_builtin.c \
../Core/lvgl/src/misc/lv_profiler_builtin_posix.c \
../Core/lvgl/src/misc/lv_rb.c \
../Core/lvgl/src/misc/lv_style.c \
../Core/lvgl/src/misc/lv_style_gen.c \
../Core/lvgl/src/misc/lv_templ.c \
../Core/lvgl/src/misc/lv_text.c \
../Core/lvgl/src/misc/lv_text_ap.c \
../Core/lvgl/src/misc/lv_timer.c \
../Core/lvgl/src/misc/lv_tree.c \
../Core/lvgl/src/misc/lv_utils.c 

OBJS += \
./Core/lvgl/src/misc/lv_anim.o \
./Core/lvgl/src/misc/lv_anim_timeline.o \
./Core/lvgl/src/misc/lv_area.o \
./Core/lvgl/src/misc/lv_array.o \
./Core/lvgl/src/misc/lv_async.o \
./Core/lvgl/src/misc/lv_bidi.o \
./Core/lvgl/src/misc/lv_circle_buf.o \
./Core/lvgl/src/misc/lv_color.o \
./Core/lvgl/src/misc/lv_color_op.o \
./Core/lvgl/src/misc/lv_event.o \
./Core/lvgl/src/misc/lv_fs.o \
./Core/lvgl/src/misc/lv_grad.o \
./Core/lvgl/src/misc/lv_iter.o \
./Core/lvgl/src/misc/lv_ll.o \
./Core/lvgl/src/misc/lv_log.o \
./Core/lvgl/src/misc/lv_lru.o \
./Core/lvgl/src/misc/lv_math.o \
./Core/lvgl/src/misc/lv_matrix.o \
./Core/lvgl/src/misc/lv_palette.o \
./Core/lvgl/src/misc/lv_pending.o \
./Core/lvgl/src/misc/lv_profiler_builtin.o \
./Core/lvgl/src/misc/lv_profiler_builtin_posix.o \
./Core/lvgl/src/misc/lv_rb.o \
./Core/lvgl/src/misc/lv_style.o \
./Core/lvgl/src/misc/lv_style_gen.o \
./Core/lvgl/src/misc/lv_templ.o \
./Core/lvgl/src/misc/lv_text.o \
./Core/lvgl/src/misc/lv_text_ap.o \
./Core/lvgl/src/misc/lv_timer.o \
./Core/lvgl/src/misc/lv_tree.o \
./Core/lvgl/src/misc/lv_utils.o 

C_DEPS += \
./Core/lvgl/src/misc/lv_anim.d \
./Core/lvgl/src/misc/lv_anim_timeline.d \
./Core/lvgl/src/misc/lv_area.d \
./Core/lvgl/src/misc/lv_array.d \
./Core/lvgl/src/misc/lv_async.d \
./Core/lvgl/src/misc/lv_bidi.d \
./Core/lvgl/src/misc/lv_circle_buf.d \
./Core/lvgl/src/misc/lv_color.d \
./Core/lvgl/src/misc/lv_color_op.d \
./Core/lvgl/src/misc/lv_event.d \
./Core/lvgl/src/misc/lv_fs.d \
./Core/lvgl/src/misc/lv_grad.d \
./Core/lvgl/src/misc/lv_iter.d \
./Core/lvgl/src/misc/lv_ll.d \
./Core/lvgl/src/misc/lv_log.d \
./Core/lvgl/src/misc/lv_lru.d \
./Core/lvgl/src/misc/lv_math.d \
./Core/lvgl/src/misc/lv_matrix.d \
./Core/lvgl/src/misc/lv_palette.d \
./Core/lvgl/src/misc/lv_pending.d \
./Core/lvgl/src/misc/lv_profiler_builtin.d \
./Core/lvgl/src/misc/lv_profiler_builtin_posix.d \
./Core/lvgl/src/misc/lv_rb.d \
./Core/lvgl/src/misc/lv_style.d \
./Core/lvgl/src/misc/lv_style_gen.d \
./Core/lvgl/src/misc/lv_templ.d \
./Core/lvgl/src/misc/lv_text.d \
./Core/lvgl/src/misc/lv_text_ap.d \
./Core/lvgl/src/misc/lv_timer.d \
./Core/lvgl/src/misc/lv_tree.d \
./Core/lvgl/src/misc/lv_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/misc/%.o Core/lvgl/src/misc/%.su Core/lvgl/src/misc/%.cyclo: ../Core/lvgl/src/misc/%.c Core/lvgl/src/misc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-misc

clean-Core-2f-lvgl-2f-src-2f-misc:
	-$(RM) ./Core/lvgl/src/misc/lv_anim.cyclo ./Core/lvgl/src/misc/lv_anim.d ./Core/lvgl/src/misc/lv_anim.o ./Core/lvgl/src/misc/lv_anim.su ./Core/lvgl/src/misc/lv_anim_timeline.cyclo ./Core/lvgl/src/misc/lv_anim_timeline.d ./Core/lvgl/src/misc/lv_anim_timeline.o ./Core/lvgl/src/misc/lv_anim_timeline.su ./Core/lvgl/src/misc/lv_area.cyclo ./Core/lvgl/src/misc/lv_area.d ./Core/lvgl/src/misc/lv_area.o ./Core/lvgl/src/misc/lv_area.su ./Core/lvgl/src/misc/lv_array.cyclo ./Core/lvgl/src/misc/lv_array.d ./Core/lvgl/src/misc/lv_array.o ./Core/lvgl/src/misc/lv_array.su ./Core/lvgl/src/misc/lv_async.cyclo ./Core/lvgl/src/misc/lv_async.d ./Core/lvgl/src/misc/lv_async.o ./Core/lvgl/src/misc/lv_async.su ./Core/lvgl/src/misc/lv_bidi.cyclo ./Core/lvgl/src/misc/lv_bidi.d ./Core/lvgl/src/misc/lv_bidi.o ./Core/lvgl/src/misc/lv_bidi.su ./Core/lvgl/src/misc/lv_circle_buf.cyclo ./Core/lvgl/src/misc/lv_circle_buf.d ./Core/lvgl/src/misc/lv_circle_buf.o ./Core/lvgl/src/misc/lv_circle_buf.su ./Core/lvgl/src/misc/lv_color.cyclo ./Core/lvgl/src/misc/lv_color.d ./Core/lvgl/src/misc/lv_color.o ./Core/lvgl/src/misc/lv_color.su ./Core/lvgl/src/misc/lv_color_op.cyclo ./Core/lvgl/src/misc/lv_color_op.d ./Core/lvgl/src/misc/lv_color_op.o ./Core/lvgl/src/misc/lv_color_op.su ./Core/lvgl/src/misc/lv_event.cyclo ./Core/lvgl/src/misc/lv_event.d ./Core/lvgl/src/misc/lv_event.o ./Core/lvgl/src/misc/lv_event.su ./Core/lvgl/src/misc/lv_fs.cyclo ./Core/lvgl/src/misc/lv_fs.d ./Core/lvgl/src/misc/lv_fs.o ./Core/lvgl/src/misc/lv_fs.su ./Core/lvgl/src/misc/lv_grad.cyclo ./Core/lvgl/src/misc/lv_grad.d ./Core/lvgl/src/misc/lv_grad.o ./Core/lvgl/src/misc/lv_grad.su ./Core/lvgl/src/misc/lv_iter.cyclo ./Core/lvgl/src/misc/lv_iter.d ./Core/lvgl/src/misc/lv_iter.o ./Core/lvgl/src/misc/lv_iter.su ./Core/lvgl/src/misc/lv_ll.cyclo ./Core/lvgl/src/misc/lv_ll.d ./Core/lvgl/src/misc/lv_ll.o ./Core/lvgl/src/misc/lv_ll.su ./Core/lvgl/src/misc/lv_log.cyclo ./Core/lvgl/src/misc/lv_log.d ./Core/lvgl/src/misc/lv_log.o ./Core/lvgl/src/misc/lv_log.su ./Core/lvgl/src/misc/lv_lru.cyclo ./Core/lvgl/src/misc/lv_lru.d ./Core/lvgl/src/misc/lv_lru.o ./Core/lvgl/src/misc/lv_lru.su ./Core/lvgl/src/misc/lv_math.cyclo ./Core/lvgl/src/misc/lv_math.d ./Core/lvgl/src/misc/lv_math.o ./Core/lvgl/src/misc/lv_math.su ./Core/lvgl/src/misc/lv_matrix.cyclo ./Core/lvgl/src/misc/lv_matrix.d ./Core/lvgl/src/misc/lv_matrix.o ./Core/lvgl/src/misc/lv_matrix.su ./Core/lvgl/src/misc/lv_palette.cyclo ./Core/lvgl/src/misc/lv_palette.d ./Core/lvgl/src/misc/lv_palette.o ./Core/lvgl/src/misc/lv_palette.su ./Core/lvgl/src/misc/lv_pending.cyclo ./Core/lvgl/src/misc/lv_pending.d ./Core/lvgl/src/misc/lv_pending.o ./Core/lvgl/src/misc/lv_pending.su ./Core/lvgl/src/misc/lv_profiler_builtin.cyclo ./Core/lvgl/src/misc/lv_profiler_builtin.d ./Core/lvgl/src/misc/lv_profiler_builtin.o ./Core/lvgl/src/misc/lv_profiler_builtin.su ./Core/lvgl/src/misc/lv_profiler_builtin_posix.cyclo ./Core/lvgl/src/misc/lv_profiler_builtin_posix.d ./Core/lvgl/src/misc/lv_profiler_builtin_posix.o ./Core/lvgl/src/misc/lv_profiler_builtin_posix.su ./Core/lvgl/src/misc/lv_rb.cyclo ./Core/lvgl/src/misc/lv_rb.d ./Core/lvgl/src/misc/lv_rb.o ./Core/lvgl/src/misc/lv_rb.su ./Core/lvgl/src/misc/lv_style.cyclo ./Core/lvgl/src/misc/lv_style.d ./Core/lvgl/src/misc/lv_style.o ./Core/lvgl/src/misc/lv_style.su ./Core/lvgl/src/misc/lv_style_gen.cyclo ./Core/lvgl/src/misc/lv_style_gen.d ./Core/lvgl/src/misc/lv_style_gen.o ./Core/lvgl/src/misc/lv_style_gen.su ./Core/lvgl/src/misc/lv_templ.cyclo ./Core/lvgl/src/misc/lv_templ.d ./Core/lvgl/src/misc/lv_templ.o ./Core/lvgl/src/misc/lv_templ.su ./Core/lvgl/src/misc/lv_text.cyclo ./Core/lvgl/src/misc/lv_text.d ./Core/lvgl/src/misc/lv_text.o ./Core/lvgl/src/misc/lv_text.su ./Core/lvgl/src/misc/lv_text_ap.cyclo ./Core/lvgl/src/misc/lv_text_ap.d ./Core/lvgl/src/misc/lv_text_ap.o ./Core/lvgl/src/misc/lv_text_ap.su ./Core/lvgl/src/misc/lv_timer.cyclo ./Core/lvgl/src/misc/lv_timer.d ./Core/lvgl/src/misc/lv_timer.o ./Core/lvgl/src/misc/lv_timer.su ./Core/lvgl/src/misc/lv_tree.cyclo ./Core/lvgl/src/misc/lv_tree.d ./Core/lvgl/src/misc/lv_tree.o ./Core/lvgl/src/misc/lv_tree.su ./Core/lvgl/src/misc/lv_utils.cyclo ./Core/lvgl/src/misc/lv_utils.d ./Core/lvgl/src/misc/lv_utils.o ./Core/lvgl/src/misc/lv_utils.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-misc

