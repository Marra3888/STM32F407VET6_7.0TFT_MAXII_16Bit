################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/drivers/display/drm/lv_linux_drm.c \
../Core/lvgl/src/drivers/display/drm/lv_linux_drm_common.c \
../Core/lvgl/src/drivers/display/drm/lv_linux_drm_egl.c 

OBJS += \
./Core/lvgl/src/drivers/display/drm/lv_linux_drm.o \
./Core/lvgl/src/drivers/display/drm/lv_linux_drm_common.o \
./Core/lvgl/src/drivers/display/drm/lv_linux_drm_egl.o 

C_DEPS += \
./Core/lvgl/src/drivers/display/drm/lv_linux_drm.d \
./Core/lvgl/src/drivers/display/drm/lv_linux_drm_common.d \
./Core/lvgl/src/drivers/display/drm/lv_linux_drm_egl.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/drivers/display/drm/%.o Core/lvgl/src/drivers/display/drm/%.su Core/lvgl/src/drivers/display/drm/%.cyclo: ../Core/lvgl/src/drivers/display/drm/%.c Core/lvgl/src/drivers/display/drm/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-display-2f-drm

clean-Core-2f-lvgl-2f-src-2f-drivers-2f-display-2f-drm:
	-$(RM) ./Core/lvgl/src/drivers/display/drm/lv_linux_drm.cyclo ./Core/lvgl/src/drivers/display/drm/lv_linux_drm.d ./Core/lvgl/src/drivers/display/drm/lv_linux_drm.o ./Core/lvgl/src/drivers/display/drm/lv_linux_drm.su ./Core/lvgl/src/drivers/display/drm/lv_linux_drm_common.cyclo ./Core/lvgl/src/drivers/display/drm/lv_linux_drm_common.d ./Core/lvgl/src/drivers/display/drm/lv_linux_drm_common.o ./Core/lvgl/src/drivers/display/drm/lv_linux_drm_common.su ./Core/lvgl/src/drivers/display/drm/lv_linux_drm_egl.cyclo ./Core/lvgl/src/drivers/display/drm/lv_linux_drm_egl.d ./Core/lvgl/src/drivers/display/drm/lv_linux_drm_egl.o ./Core/lvgl/src/drivers/display/drm/lv_linux_drm_egl.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-drivers-2f-display-2f-drm

