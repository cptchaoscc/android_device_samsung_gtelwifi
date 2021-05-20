# Inherit common Arrow stuff
$(call inherit-product, vendor/arrow/config/common.mk)

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME

# Include CM LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/arrow/overlay/dictionaries

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/arrow/prebuilt/common/bootanimation/800.zip:system/media/bootanimation.zip
endif
