$(call inherit-product, device/samsung/jflte/full_jflte.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jflteuc TARGET_DEVICE=jflte BUILD_FINGERPRINT="custom" PRIVATE_BUILD_DESC="custom"

PRODUCT_NAME := cm_jflte
PRODUCT_DEVICE := jflte

