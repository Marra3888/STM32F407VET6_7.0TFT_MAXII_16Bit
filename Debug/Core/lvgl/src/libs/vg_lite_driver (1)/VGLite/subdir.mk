################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.c \
../Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.c \
../Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.c \
../Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.c \
../Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.c 

OBJS += \
./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.o \
./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.o \
./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.o \
./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.o \
./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.o 

C_DEPS += \
./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.d \
./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.d \
./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.d \
./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.d \
./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/libs/vg_lite_driver/VGLite/%.o Core/lvgl/src/libs/vg_lite_driver/VGLite/%.su Core/lvgl/src/libs/vg_lite_driver/VGLite/%.cyclo: ../Core/lvgl/src/libs/vg_lite_driver/VGLite/%.c Core/lvgl/src/libs/vg_lite_driver/VGLite/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite

clean-Core-2f-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite:
	-$(RM) ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.cyclo ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.d ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.o ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite.su ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.cyclo ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.d ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.o ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_image.su ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.cyclo ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.d ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.o ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_matrix.su ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.cyclo ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.d ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.o ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_path.su ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.cyclo ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.d ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.o ./Core/lvgl/src/libs/vg_lite_driver/VGLite/vg_lite_stroke.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-libs-2f-vg_lite_driver-2f-VGLite

