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
# Boot animation (XXX: find7s?)
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

## Specify phone tech before including full_phone
$(call inherit-product, vendor/pace/config/gsm.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/pace/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/pace/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/oneplus/bacon/bacon.mk)
$(call inherit-product, device/oneplus/bacon/mdt.mk)


PRODUCT_DEVICE := bacon
PRODUCT_NAME := full_bacon
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := One
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=oneplus/bacon/A0001:4.4.2/KVT49L/XNPH25R:user/release-keys PRIVATE_BUILD_DESC="bacon-user 4.4.2 KVT49L XNPH25R release-keys"

PRODUCT_NAME := aosp_bacon

PRODUCT_PACKAGES += \
    Launcher3

