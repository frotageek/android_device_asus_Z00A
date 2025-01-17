#
# Copyright 2013 The Android Open-Source Project
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
DEVICE_PATH := device/asus/Z00A

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

#DEVICE_PACKAGE_OVERLAYS := \
#    $(DEVICE_PATH)/overlay

# Boot image Signature
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keys/boot_z00a.sig:install/bin/boot.sig

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:vendor/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:vendor/etc/permissions/android.hardware.nfc.hce.xml

# NFC
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/nfc/libnfc-brcm.conf:vendor/etc/libnfc-brcm.conf \
    $(DEVICE_PATH)/nfc/libnfc-brcm-20795a20.conf:vendor/etc/libnfc-brcm-20795a20.conf


# NFC packages
PRODUCT_PACKAGES += \
    nfc_nci.bcm2079x.default \
    NfcNci \
    Tag

## Properties
TARGET_SYSTEM_PROP += $(DEVICE)/system.prop

$(call inherit-product-if-exists, vendor/asus/Z00A/Z00A-vendor.mk)

# Inherit from mofd-common
$(call inherit-product, device/asus/mofd-common/mofd.mk)
