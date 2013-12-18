# Copyright (C) 2013 The Android Open Source Project
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

# Platform specific overlays
DEVICE_PACKAGE_OVERLAYS := device/sony/c2105/overlay

# Get the long list of apns, must be before the full_base_telephony.mk
PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Include others
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, vendor/sony/c2105/c2105-vendor.mk)
$(call inherit-product-if-exists, vendor/google/products/gms.mk)

# Product attributes
PRODUCT_NAME := full_c2105
PRODUCT_DEVICE := c2105
PRODUCT_MODEL := C2105
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_LOCALES += hdpi mdpi
PRODUCT_CHARACTERISTICS := nosdcard

# Copy prebuilt kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/sony/c2105/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

# Add extra packages
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    charger \
    charger_res_images \
    e2fsck \
    libnl_2 \
    libaudio-resampler \
    libnfc_jni \
    libnfc \
    setup_fs \
    bttest \
    libbluedroid \
    libtinyxml \
    hostapd_cli \
    com.android.nfc_extras \
    AccountAndSyncSettings \
    AlarmProvider \
    Camera \
    Nfc \
    SoundRecorder \
    Stk \
    Sync \
    SyncProvider \
    Updater \

#sony thinks too much
PRODUCT_COPY_FILES += \
    device/sony/c2105/rootdir/root/init.sony.rc:root/init.sony.rc \
    device/sony/c2105/rootdir/root/logo.rle:root/logo.rle \
    device/sony/c2105/rootdir/root/fstab.sony:root/fstab.sony \
    device/sony/c2105/rootdir/root/ueventd.sony.rc:root/ueventd.sony.rc \
    device/sony/c2105/rootdir/root/init.sony.usb.rc:root/init.sony.usb.rc \
    device/sony/c2105/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/sony/c2105/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    device/sony/c2105/rootdir/system/etc/gps.conf:system/etc/gps.conf \
    device/sony/c2105/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/sony/c2105/rootdir/system/etc/snd_soc_msm/snd_soc_msm_Sitar:system/etc/snd_soc_msm/snd_soc_msm_Sitar \
    device/sony/c2105/rootdir/system/etc/nfcee_access.xml:system/etc/nfcee_access.xml \
    device/sony/c2105/rootdir/system/etc/thermald.conf:system/etc/thermald.conf \
    device/sony/c2105/rootdir/system/etc/vold.fstab:system/etc/vold.fstab \
    device/sony/c2105/rootdir/system/usr/keychars/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm \
    device/sony/c2105/rootdir/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/sony/c2105/rootdir/system/usr/keylayout/cyttsp3-i2c.kl:system/usr/keylayout/cyttsp3-i2c.kl \
    device/sony/c2105/rootdir/system/usr/keylayout/msm8930-sitar-snd-card_Button_Jack.kl:system/usr/keylayout/msm8930-sitar-snd-card_Button_Jack.kl \
    device/sony/c2105/rootdir/system/usr/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    device/sony/c2105/rootdir/system/usr/keylayout/simple_remote_appkey.kl:system/usr/keylayout/simple_remote_appkey.kl \
    device/sony/c2105/rootdir/system/usr/keylayout/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
    
# Copy extra files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

#include frameworks/base/data/videos/VideoPackage1.mk
#
#include device/sony/c2105/BoardConfig.mk

