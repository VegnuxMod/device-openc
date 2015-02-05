# config.mk
#
# Product-specific compile-time definitions.
#

# Platform
TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM_GPU := qcom-adreno302
TARGET_BOARD_PLATFORM := msm8610
TARGET_BOOTLOADER_BOARD_NAME := MSM8610

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_ARCH_VARIANT := armv7-a-neon

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DAP := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_DISABLED_SSR := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/qcom/openc/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true

# Camera
USE_CAMERA_STUB := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Graphics
BOARD_EGL_CFG := device/qcom/openc/prebuilt/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

# Kernel
KERNEL_DEFCONFIG := msm8610-zte_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 androidboot.selinux=permissive
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000

TARGET_SPECIFIC_HEADER_PATH += device/qcom/openc/include

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_CACHEIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 73400320
BOARD_USBIMAGE_PARTITION_SIZE_KB := 1048576
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# QCOM
TARGET_USES_QCOM_BSP := true

# Recovery
TARGET_RECOVERY_FSTAB := device/qcom/openc/ramdisk/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# SELinux
BOARD_SEPOLICY_DIRS := \
    device/qcom/common/sepolicy

BOARD_SEPOLICY_UNION := \
    netd.te

# Vendor init
TARGET_INIT_VENDOR_LIB := libinit_msm

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
TARGET_USES_WCNSS_CTRL := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"
COMMON_GLOBAL_CFLAGS += -DUSE_ZTE_MAC_DRIVER
