################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/lvgl/src/libs/fsdrv/lv_fs_cbfs.c \
../Core/lvgl/src/libs/fsdrv/lv_fs_fatfs.c \
../Core/lvgl/src/libs/fsdrv/lv_fs_frogfs.c \
../Core/lvgl/src/libs/fsdrv/lv_fs_littlefs.c \
../Core/lvgl/src/libs/fsdrv/lv_fs_memfs.c \
../Core/lvgl/src/libs/fsdrv/lv_fs_posix.c \
../Core/lvgl/src/libs/fsdrv/lv_fs_stdio.c \
../Core/lvgl/src/libs/fsdrv/lv_fs_uefi.c \
../Core/lvgl/src/libs/fsdrv/lv_fs_win32.c 

OBJS += \
./Core/lvgl/src/libs/fsdrv/lv_fs_cbfs.o \
./Core/lvgl/src/libs/fsdrv/lv_fs_fatfs.o \
./Core/lvgl/src/libs/fsdrv/lv_fs_frogfs.o \
./Core/lvgl/src/libs/fsdrv/lv_fs_littlefs.o \
./Core/lvgl/src/libs/fsdrv/lv_fs_memfs.o \
./Core/lvgl/src/libs/fsdrv/lv_fs_posix.o \
./Core/lvgl/src/libs/fsdrv/lv_fs_stdio.o \
./Core/lvgl/src/libs/fsdrv/lv_fs_uefi.o \
./Core/lvgl/src/libs/fsdrv/lv_fs_win32.o 

C_DEPS += \
./Core/lvgl/src/libs/fsdrv/lv_fs_cbfs.d \
./Core/lvgl/src/libs/fsdrv/lv_fs_fatfs.d \
./Core/lvgl/src/libs/fsdrv/lv_fs_frogfs.d \
./Core/lvgl/src/libs/fsdrv/lv_fs_littlefs.d \
./Core/lvgl/src/libs/fsdrv/lv_fs_memfs.d \
./Core/lvgl/src/libs/fsdrv/lv_fs_posix.d \
./Core/lvgl/src/libs/fsdrv/lv_fs_stdio.d \
./Core/lvgl/src/libs/fsdrv/lv_fs_uefi.d \
./Core/lvgl/src/libs/fsdrv/lv_fs_win32.d 


# Each subdirectory must supply rules for building sources it contributes
Core/lvgl/src/libs/fsdrv/%.o Core/lvgl/src/libs/fsdrv/%.su Core/lvgl/src/libs/fsdrv/%.cyclo: ../Core/lvgl/src/libs/fsdrv/%.c Core/lvgl/src/libs/fsdrv/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DLV_LVGL_H_INCLUDE_SIMPLE -DDEBUG -DLV_CONF_INCLUDE_SIMPLE -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"../Core/lvgl" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-lvgl-2f-src-2f-libs-2f-fsdrv

clean-Core-2f-lvgl-2f-src-2f-libs-2f-fsdrv:
	-$(RM) ./Core/lvgl/src/libs/fsdrv/lv_fs_cbfs.cyclo ./Core/lvgl/src/libs/fsdrv/lv_fs_cbfs.d ./Core/lvgl/src/libs/fsdrv/lv_fs_cbfs.o ./Core/lvgl/src/libs/fsdrv/lv_fs_cbfs.su ./Core/lvgl/src/libs/fsdrv/lv_fs_fatfs.cyclo ./Core/lvgl/src/libs/fsdrv/lv_fs_fatfs.d ./Core/lvgl/src/libs/fsdrv/lv_fs_fatfs.o ./Core/lvgl/src/libs/fsdrv/lv_fs_fatfs.su ./Core/lvgl/src/libs/fsdrv/lv_fs_frogfs.cyclo ./Core/lvgl/src/libs/fsdrv/lv_fs_frogfs.d ./Core/lvgl/src/libs/fsdrv/lv_fs_frogfs.o ./Core/lvgl/src/libs/fsdrv/lv_fs_frogfs.su ./Core/lvgl/src/libs/fsdrv/lv_fs_littlefs.cyclo ./Core/lvgl/src/libs/fsdrv/lv_fs_littlefs.d ./Core/lvgl/src/libs/fsdrv/lv_fs_littlefs.o ./Core/lvgl/src/libs/fsdrv/lv_fs_littlefs.su ./Core/lvgl/src/libs/fsdrv/lv_fs_memfs.cyclo ./Core/lvgl/src/libs/fsdrv/lv_fs_memfs.d ./Core/lvgl/src/libs/fsdrv/lv_fs_memfs.o ./Core/lvgl/src/libs/fsdrv/lv_fs_memfs.su ./Core/lvgl/src/libs/fsdrv/lv_fs_posix.cyclo ./Core/lvgl/src/libs/fsdrv/lv_fs_posix.d ./Core/lvgl/src/libs/fsdrv/lv_fs_posix.o ./Core/lvgl/src/libs/fsdrv/lv_fs_posix.su ./Core/lvgl/src/libs/fsdrv/lv_fs_stdio.cyclo ./Core/lvgl/src/libs/fsdrv/lv_fs_stdio.d ./Core/lvgl/src/libs/fsdrv/lv_fs_stdio.o ./Core/lvgl/src/libs/fsdrv/lv_fs_stdio.su ./Core/lvgl/src/libs/fsdrv/lv_fs_uefi.cyclo ./Core/lvgl/src/libs/fsdrv/lv_fs_uefi.d ./Core/lvgl/src/libs/fsdrv/lv_fs_uefi.o ./Core/lvgl/src/libs/fsdrv/lv_fs_uefi.su ./Core/lvgl/src/libs/fsdrv/lv_fs_win32.cyclo ./Core/lvgl/src/libs/fsdrv/lv_fs_win32.d ./Core/lvgl/src/libs/fsdrv/lv_fs_win32.o ./Core/lvgl/src/libs/fsdrv/lv_fs_win32.su

.PHONY: clean-Core-2f-lvgl-2f-src-2f-libs-2f-fsdrv

