
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product-if-exists, vendor/qcom/openc/kis3-vendor.mk)

# Device identifier
PRODUCT_DEVICE := openc
PRODUCT_NAME := openc
PRODUCT_BRAND := qcom
PRODUCT_MODEL := Open C
PRODUCT_MANUFACTURER := qcom
PRODUCT_RELEASE_NAME := Open C

# Audio
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle

# Bluetooth
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# GPS
PRODUCT_PACKAGES += \
    gps.msm8610

# Lights
PRODUCT_PACKAGES += \
    lights.MSM8610

# Wifi
PRODUCT_PACKAGES += wcnss_service

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/qcom/openc/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/qcom/openc/prebuilt/system,system)

# Gecko low-memory killer setting overrides
#
# It would be nice to use PRODUCT_COPY_FILES here instead but that is not
# currently possible due to various |rm -rf ...| commands in
# {gaia,gonk-misc}/Android.mk that Make does not know about.
#
out/target/product/$(TARGET_PRODUCT)/system/gecko: gaia/profile/defaults/pref/lmk.js
.PHONY: gaia/profile/defaults/pref/lmk.js
gaia/profile/defaults/pref/lmk.js: gaia/profile.tar.gz
	echo 'pref("hal.processPriorityManager.gonk.BACKGROUND.KillUnderKB", 10240);' > $@
	echo 'pref("hal.processPriorityManager.gonk.notifyLowMemUnderKB", 9216);' >> $@

# Target-specific Gaia configuration
LOCAL_PATH:=$(dir $(firstword $(MAKEFILE_LIST)))
GAIA_DISTRIBUTION_SRC_FILES:=$(GAIA_DISTRIBUTION_SRC_FILES)
GAIA_DISTRIBUTION_SRC_FILES+=$(wildcard $(LOCAL_PATH)/gaia_distribution/*)
