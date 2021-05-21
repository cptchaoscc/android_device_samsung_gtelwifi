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

ro.build.characteristics=tablet

LOCAL_PATH := device/samsung/gtelwifi

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi

# Audio
PRODUCT_PACKAGES += \
    audio.primary.sc8830 \
    audio_policy.sc8830 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libtinyalsa \
    libaudio-resampler

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libtinyalsa
    audio_hw.xml \
	audio_para \
	audio_effects_vendor.conf \
	audio_policy.conf \
	codec_pga.xml \
	tiny_hw.xml \
	audio.primary.sc8830 \
	libaudio-resampler


# Bluetooth
PRODUCT_PACKAGES += \
    libbluetooth_jni \
	bluetooth.default \
	libbt-vendor

# Camera
PRODUCT_PACKAGES += \
	Snap \
	camera.sc8830

PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Codecs
PRODUCT_PACKAGES += \
	libcolorformat_switcher \
	libstagefrighthw \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec \
	libstagefright_sprd_aacdec \
	libstagefright_sprd_mp3dec

# seccomp
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# Common libs
PRODUCT_PACKAGES += \
	libstlport \
	librilutils \
	libril_shim \
	libgps_shim \
	libphoneserver_shim

# RIL
PRODUCT_PACKAGES += \
	libatchannel \
	libsecril-client \
	libsecril-shim \
	libril \
	rild \
	modemd \
	modem_control

PRODUCT_PROPERTY_OVERRIDES += \
	ro.radio.modemtype=w \
	rild.libpath=/system/vendor/lib/libsecril-shim.so

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/system/etc/init/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.rc

# Filesystem management tools
PRODUCT_PACKAGES += \
	f2fstat \
	fibmap.f2fs \
	fsck.f2fs \
	mkfs.f2fs \
	setup_fs \

# Misc packages
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory \
    
# Samsung Service Mode
PRODUCT_PACKAGES += \
	SamsungServiceMode

# Graphics
PRODUCT_PACKAGES += \
    libHWCUtils \
    gralloc.sc8830 \
    hwcomposer.sc8830 \
    sprd_gsp.sc8830 \
    libmemoryheapion \
    libion_sprd

# GPS
PRODUCT_PACKAGES += \
	libgpspc \
	libefuse \
	gps.conf \
	gps.xml


# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/headset-keyboard.kl:system/usr/keylayout/headset-keyboard.kl \
    $(LOCAL_PATH)/keylayout/sci-keypad.kl:system/usr/keylayout/sci-keypad.kl

# System init.rc files
PRODUCT_PACKAGES += \
	at_distributor.rc \
	chown_service.rc \
	data.rc \
	dns.rc \
	engpc.rc \
	gpsd.rc \
	kill_phone.rc \
	macloader.rc \
	modem_control.rc \
	modemd.rc \
	nvitemd.rc \
	phoneserver.rc \
	refnotify.rc \
	set_mac.rc \
	smd_symlink.rc \
	swap.rc \
	wpa_supplicant.rc

# Rootdir files
PRODUCT_PACKAGES += \
	init.board.rc \
	init.wifi.rc \
	init.sc8830.rc \
	init.sc8830.usb.rc \
	ueventd.sc8830.rc

# Packages
PRODUCT_PACKAGES += \
	Jelly

# Lights
PRODUCT_PACKAGES += \
	lights.sc8830

# Rootdir
PRODUCT_PACKAGES += \
	fstab.sc8830

# Interactive governor configs
PRODUCT_PACKAGES += \
	interactive_gov.rc

# Media config
PRODUCT_PACKAGES += \
	media_codecs.xml
    media_profiles_V1_0.xml

MEDIA_XML_CONFIGS := \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_XML_CONFIGS),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/$(notdir $(f)))

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/system/etc/init/android.hardware.media.omx@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.media.omx@1.0-service.rc \
	$(LOCAL_PATH)/system/etc/init/mediaserver.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/mediaserver.rc


# Permissions
PERMISSION_XML_FILES := \
    frameworks/native/data/etc/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.software.midi.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml

PRODUCT_COPY_FILES += \
    $(foreach f,$(PERMISSION_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))
	

# PowerHAL
PRODUCT_PACKAGES += \
    power.sc8830

# WiFi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    wpa_supplicant \
    hostapd \
    macloader

# Languages
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=en \
	ro.product.locale.region=GB

# Wifi
PRODUCT_PACKAGES += \
	macloader \
	libandroid_net \
	libwpa_client \
	wificond \
	wifilogd \
	wpa_supplicant.conf \
	wpa_supplicant_overlay.conf \
	p2p_supplicant_overlay.conf

# Disable mobile data on first boot
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.mobiledata=false

# Disable treble OMX
PRODUCT_PROPERTY_OVERRIDES += \
	persist.media.treble_omx=false

# HIDL (HAL Interface Definition Language)
include $(LOCAL_PATH)/hidl.mk

# Performance
PRODUCT_PROPERTY_OVERRIDES += \
	sys.use_fifo_ui=1


# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-flags=--no-watch-dog \
	dalvik.vm.image-dex2oat-filter=quicken \
	dalvik.vm.dex2oat-filter=quicken \
	pm.dexopt.first-boot=quicken \
	pm.dexopt.boot=verify \
	pm.dexopt.install=verify \
	pm.dexopt.bg-dexopt=quicken \
	pm.dexopt.ab-ota=quicken \
	pm.dexopt.inactive=verify \
	pm.dexopt.shared=quicken


# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1


# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)


# For userdebug builds
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1 \
    ro.boot.selinux=permissive

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb

# Android Go
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.low_ram=true

PRODUCT_NAME := arrow_gtelwifi
PRODUCT_DEVICE := gtelwifi
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-T560

$(call inherit-product-if-exists, vendor/samsung/gtelwifi/gtelwifi-vendor.mk)
