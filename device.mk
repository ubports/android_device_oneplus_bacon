#
# Copyright (C) 2014 The CyanogenMod Project
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

# overlays

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay vendor/extra/overlays/phone-1080p

# Haters gonna hate..
PRODUCT_CHARACTERISTICS := nosdcard

# For Ubuntu Touch 

PRODUCT_COPY_FILES += \
	device/oppo/msm8974-common/wifi/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
	device/oppo/msm8974-common/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
	device/oppo/msm8974-common/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	device/oppo/msm8974-common/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/primaWCNSS_cfg.dat \
	device/oppo/msm8974-common/wifi/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	device/oppo/msm8974-common/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
	device/oneplus/bacon/configs-ubuntu/init.bacon.rc:root/init.bacon.rc \
	device/oneplus/bacon/configs-ubuntu/ueventd.qcom.rc:root/ueventd.qcom.rc \
	device/oneplus/bacon/configs-ubuntu/fstab.bacon:root/fstab.bacon \
	device/oneplus/bacon/configs-ubuntu/init.qcom-common.rc:root/init.qcom-common.rc \
	device/oneplus/bacon/configs-ubuntu/init.qcom.bt.sh:root/system/etc/init.qcom.bt.sh \
	device/oneplus/bacon/configs-ubuntu/init_wlan.sh:root/system/etc/init_wlan.sh \
	device/oneplus/bacon/configs-ubuntu/init.bacon.wifi.sh:root/system/etc/init.bacon.wifi.sh \
	device/oneplus/bacon/configs-ubuntu/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
	device/oneplus/bacon/configs-ubuntu/init_wlan.sh:system/etc/init_wlan.sh \
        device/oneplus/bacon/configs-ubuntu/init.qcom.usb.rc:root/init.qcom.usb.rc \
	device/oneplus/bacon/configs-ubuntu/init.bacon.wifi.sh:system/etc/init.bacon.wifi.sh


# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml



# Keylayouts
PRODUCT_PACKAGES += \
    $(LOCAL_PATH)/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# NFC packages
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    nfc_nci.bacon \
    com.android.nfc_extras

PRODUCT_PACKAGES += \
    conn_init

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/configs/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=10


# call the proprietary setup
$(call inherit-product-if-exists, vendor/oneplus/bacon/bacon-vendor.mk)
$(call inherit-product, device/oneplus/bacon/mdt.mk)

ifneq ($(QCPATH),)
$(call inherit-product-if-exists, $(QCPATH)/prebuilt_HY11/target/product/msm8974/prebuilt.mk)
endif

# Inherit from msm8974-common
$(call inherit-product, device/oppo/msm8974-common/msm8974.mk)
