#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/gtelwifi

TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

# SPRD hardware
BOARD_USES_SPRD_HARDWARE := true
SOC_SCX30G_V2 := true

# CMHW
BOARD_HARDWARE_CLASS := device/samsung/sprd-common/cmhw/

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := SC7730SE

TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := sc8830
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
BOARD_VENDOR := samsung

BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8,androidboot.hardware=sc8830
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100

BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androidkernel-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin
TARGET_CUSTOM_DTBTOOL := dtbToolSPRD

TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_CONFIG := gtelwifi_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/gtelwifi

BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 6291456000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 23001563136
BOARD_CACHEIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

# Audio
BOARD_USES_TINYALSA_AUDIO := true
TARGET_TINY_ALSA_IGNORE_SILENCE_SIZE := true

# FM radio
BOARD_HAVE_FM_BCM := true
BOARD_HAVE_FMRADIO_BCM := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
USE_BLUETOOTH_BCM4343 := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/libbt_vndcfg.txt

# Camera
#USE_CAMERA_STUB := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_NO_CHARGER_LED := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness

# Codecs
BOARD_CANT_REALLOCATE_OMX_BUFFERS := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_SPRD_MEMORYHEAPION := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
HWUI_COMPILE_FOR_PERF := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true
TARGET_FORCE_SCREENSHOT_CPU_PATH := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
# Enable WEBGL in WebKit
ENABLE_WEBGL := true


# HWComposer
USE_SPRD_HWCOMPOSER := true
USE_OVERLAY_COMPOSER_GPU := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# PowerHAL
TARGET_POWERHAL_VARIANT := scx35

# RIL
BOARD_PROVIDES_RILD := true
BOARD_RIL_CLASS := ../../../device/samsung/sprd-common/ril
TARGET_DISABLE_ASHMEM_TRACKING := true

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WLAN_DEVICE_REV := bcm4343
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_NVRAM_PATH_PARAM := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH := "/system/etc/wifi/nvram_net.txt"
WIFI_BAND := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Bionic
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Build system
WITHOUT_CHECK_API := true

# Lights
TARGET_HAS_BACKLIT_KEYS := false

# Target shims
TARGET_LD_SHIM_LIBS := \
	/system/vendor/bin/gpsd|libgps_shim.so

# Init
TARGET_INIT_VENDOR_LIB := libinit_sec

# Board specific features
#TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.sc8830

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/manifest.xml

# Use MALLOC_SVELTE for such low memory devices like us
MALLOC_SVELTE := true
BOARD_USES_LEGACY_MMAP := true

# Enable dex-preoptimization to speed up first boot sequence
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
PRODUCT_DEX_PREOPT_BOOT_FLAGS += --compiler-filter=speed
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed
WITH_DEX_PREOPT_GENERATE_PROFILE := false

# System properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.sc8830
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_SUPPRESS_EMMC_WIPE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := SM-T560,gtelwifi

# inherit from the proprietary version
-include vendor/samsung/gtelwifi/BoardConfigVendor.mk
