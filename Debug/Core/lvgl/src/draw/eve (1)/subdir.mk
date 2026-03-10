################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/draw/eve/lv_draw_eve.c \
../Core/lvgl/src/draw/eve/lv_draw_eve_arc.c \
../Core/lvgl/src/draw/eve/lv_draw_eve_fill.c \
../Core/lvgl/src/draw/eve/lv_draw_eve_image.c \
../Core/lvgl/src/draw/eve/lv_draw_eve_letter.c \
../Core/lvgl/src/draw/eve/lv_draw_eve_line.c \
../Core/lvgl/src/draw/eve/lv_draw_eve_ram_g.c \
../Core/lvgl/src/draw/eve/lv_draw_eve_triangle.c \
../Core/lvgl/src/draw/eve/lv_eve.c 

OBJS += \
./Core/lvgl/src/draw/eve/lv_draw_eve.o \
./Core/lvgl/src/draw/eve/lv_draw_eve_arc.o \
./Core/lvgl/src/draw/eve/lv_draw_eve_fill.o \
./Core/lvgl/src/draw/eve/lv_draw_eve_image.o \
./Core/lvgl/src/draw/eve/lv_draw_eve_letter.o \
./Core/lvgl/src/draw/eve/lv_draw_eve_line.o \
./Core/lvgl/src/draw/eve/lv_draw_eve_ram_g.o \
./Core/lvgl/src/draw/eve/lv_draw_eve_triangle.o \
./Core/lvgl/src/draw/eve/lv_eve.o 

C_DEPS += \
./Core/lvgl/src/draw/eve/lv_draw_eve.d \
./Core/lvgl/src/draw/eve/lv_draw_eve_arc.d \
./Core/lvgl/src/draw/eve/lv_draw_eve_fill.d \
./Core/lvgl/src/draw/eve/lv_draw_eve_image.d \
./Core/lvgl/src/draw/eve/lv_draw_eve_letter.d \
./Core/lvgl/src/draw/eve/lv_draw_eve_line.d \
./Core/lvgl/src/draw/eve/lv_draw_eve_ram_g.d \
./Core/lvgl/src/draw/eve/lv_draw_eve_triangle.d \
./Core/lvgl/src/draw/eve/lv_eve.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/draw/eve/%.o Core/lvgl/src/draw/eve/%.su Core/lvgl/src/draw/eve/%.cyclo: ../Core/lvgl/src/draw/eve/%.c Core/lvgl/src/draw/eve/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-draw-2f-eve

clean-Core-2f-lvgl-2f-src-2f-draw-2f-eve:
	-$(RM) ./Core/lvgl/src/draw/eve/lv_draw_eve.cyclo ./Core/lvgl/src/draw/eve/lv_draw_eve.d ./Core/lvgl/src/draw/eve/lv_draw_eve.o ./Core/lvgl/src/draw/eve/lv_draw_eve.su ./Core/lvgl/src/draw/eve/lv_draw_eve_arc.cyclo ./Core/lvgl/src/draw/eve/lv_draw_eve_arc.d ./Core/lvgl/src/draw/eve/lv_draw_eve_arc.o ./Core/lvgl/src/draw/eve/lv_draw_eve_arc.su ./Core/lvgl/src/draw/eve/lv_draw_eve_fill.cyclo ./Core/lvgl/src/draw/eve/lv_draw_eve_fill.d ./Core/lvgl/src/draw/eve/lv_draw_eve_fill.o ./Core/lvgl/src/draw/eve/lv_draw_eve_fill.su ./Core/lvgl/src/draw/eve/lv_draw_eve_image.cyclo ./Core/lvgl/src/draw/eve/lv_draw_eve_image.d ./Core/lvgl/src/draw/eve/lv_draw_eve_image.o ./Core/lvgl/src/draw/eve/lv_draw_eve_image.su ./Core/lvgl/src/draw/eve/lv_draw_eve_letter.cyclo ./Core/lvgl/src/draw/eve/lv_draw_eve_letter.d ./Core/lvgl/src/draw/eve/lv_draw_eve_letter.o ./Core/lvgl/src/draw/eve/lv_draw_eve_letter.su ./Core/lvgl/src/draw/eve/lv_draw_eve_line.cyclo ./Core/lvgl/src/draw/eve/lv_draw_eve_line.d ./Core/lvgl/src/draw/eve/lv_draw_eve_line.o ./Core/lvgl/src/draw/eve/lv_draw_eve_line.su ./Core/lvgl/src/draw/eve/lv_draw_eve_ram_g.cyclo ./Core/lvgl/src/draw/eve/lv_draw_eve_ram_g.d ./Core/lvgl/src/draw/eve/lv_draw_eve_ram_g.o ./Core/lvgl/src/draw/eve/lv_draw_eve_ram_g.su ./Core/lvgl/src/draw/eve/lv_draw_eve_triangle.cyclo ./Core/lvgl/src/draw/eve/lv_draw_eve_triangle.d ./Core/lvgl/src/draw/eve/lv_draw_eve_triangle.o ./Core/lvgl/src/draw/eve/lv_draw_eve_triangle.su ./Core/lvgl/src/draw/eve/lv_eve.cyclo ./Core/lvgl/src/draw/eve/lv_eve.d ./Core/lvgl/src/draw/eve/lv_eve.o ./Core/lvgl/src/draw/eve/lv_eve.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-draw-2f-eve

