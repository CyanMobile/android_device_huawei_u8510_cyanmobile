DEVICE:=u8510
MANUFACTURER:=huawei

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/huawei/u8510/device_u8510-vendor.mk)

$(call inherit-product, build/target/product/full_base.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/u8510/overlay

#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := huawei_u8510
PRODUCT_DEVICE := u8510
PRODUCT_MODEL := huawei_u8510
#PRODUCT_LOCALES := zh_CN zh_TW en_US

PRODUCT_PACKAGES += \
    libcamera \
    libOmxVidEnc \
    gps.u8510 \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    libOmxCore \
    make_ext4fs \
    CMTimers \
    FM \
    CMDroidwall \
    libRS \
    hwprops \
    HuaweiUpdater \
    rzscontrol \
    dump_image \
    e2fsck \
    erase_image \
    flash_image \
    screencap \
    dexpreopt

DISABLE_DEXPREOPT := false

# Keylayouts
PRODUCT_COPY_FILES += \
    device/$(MANUFACTURER)/$(DEVICE)/usr/keychars/surf_keypad.kcm.bin:system/usr/keychars/surf_keypad.kcm.bin \
    device/$(MANUFACTURER)/$(DEVICE)/usr/keychars/surf_keypad.kcm.bin:system/usr/keychars/synaptics.kcm.bin \
    device/$(MANUFACTURER)/$(DEVICE)/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/$(MANUFACTURER)/$(DEVICE)/usr/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl

# fstab
PRODUCT_COPY_FILES += \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/etc/vold.fstab:system/etc/vold.fstab

# bluetooth
PRODUCT_COPY_FILES += \
    device/$(MANUFACTURER)/$(DEVICE)/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# apns-conf.xml
#PRODUCT_COPY_FILES += \
#    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/etc/apns-conf.xml:system/etc/apns-conf.xml

PRODUCT_COPY_FILES += \
    device/$(MANUFACTURER)/$(DEVICE)/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Init
PRODUCT_COPY_FILES += \
    device/$(MANUFACTURER)/$(DEVICE)/root/init.huawei.rc:root/init.huawei.rc \
    device/$(MANUFACTURER)/$(DEVICE)/root/init.rc:root/init.rc \
    device/$(MANUFACTURER)/$(DEVICE)/root/ueventd.rc:root/ueventd.rc

# Audio
# write 0 in AutoVolumeControl.txt to disable AutoVolumeControl.txt
PRODUCT_COPY_FILES += \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/$(MANUFACTURER)/$(DEVICE)/prebuild/poweron.ogg:system/media/poweron.ogg \
    device/$(MANUFACTURER)/$(DEVICE)/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt 

#Media profile
PRODUCT_COPY_FILES += \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/etc/media_profiles.xml:system/etc/media_profiles.xml

# Wifi stuff
PRODUCT_COPY_FILES += \
    device/$(MANUFACTURER)/$(DEVICE)/prebuild/dhd.ko:system/wifi/dhd.ko \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/wifi/firmware.bin:system/wifi/firmware.bin \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/wifi/firmware_apsta.bin:system/wifi/firmware_apsta.bin \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/wifi/nvram.txt:system/wifi/nvram.txt \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/wifi/bcm_loadecho.sh:system/wifi/bcm_loadecho.sh \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/wifi/bcm_loadipf.sh:system/wifi/bcm_loadipf.sh \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/wifi/connectap.sh:system/wifi/connectap.sh \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/wifi/iwconfig:system/wifi/iwconfig \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/wifi/iwlist:system/wifi/iwlist \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/wifi/iwpriv:system/wifi/iwpriv \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/wifi/nvram.txt:system/wifi/nvram.txt \
    vendor/$(MANUFACTURER)/$(DEVICE)/proprietary/wifi/udp_server:system/wifi/udp_server \

## Tweaks
PRODUCT_COPY_FILES += \
    device/$(MANUFACTURER)/$(DEVICE)/prebuild/70zipalign:system/etc/init.d/70zipalign \
    device/$(MANUFACTURER)/$(DEVICE)/prebuild/zipalign:system/bin/zipalign \
    device/$(MANUFACTURER)/$(DEVICE)/prebuild/be_photo:system/etc/be_photo \
    device/$(MANUFACTURER)/$(DEVICE)/prebuild/be_movie:system/etc/be_movie \
    device/$(MANUFACTURER)/$(DEVICE)/shutdownanimation.zip:system/media/shutdownanimation.zip \
    device/$(MANUFACTURER)/$(DEVICE)/app/ics.apk:system/app/ics.apk

## application
PRODUCT_COPY_FILES += \
    device/$(MANUFACTURER)/$(DEVICE)/app/BMKG.apk:system/app/BMKG.apk

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml
