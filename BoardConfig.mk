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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from common msm8930
-include device/samsung/msm8930-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/loganreltexx/include

BOARD_KERNEL_CMDLINE         := androidboot.hardware=qcom user_debug=22 zcache msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_BASE            := 0x80200000
BOARD_MKBOOTIMG_ARGS         := --ramdisk_offset 0x02000000
BOARD_KERNEL_PAGESIZE        := 2048
TARGET_KERNEL_SOURCE         := kernel/samsung/msm8930-common
TARGET_KERNEL_CONFIG         := cyanogen_loganre_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8930_loganre_eur_lte_defconfig

TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Assert
TARGET_OTA_ASSERT_DEVICE := loganreltexx,loganrelte,GT-S7275R,GT-S7275B,GT-S7275T

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/loganreltexx/rootdir/fstab.qcom

# Reduce space taken by the journal
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Partition sizes
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1698693120
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5693733888
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/loganreltexx/bluetooth

# NFC
#BOARD_HAVE_NFC := true
#BOARD_NFC_CHIPSET := pn547
#BOARD_NFC_LPM_LOSES_CONFIG := true

# Audio
USE_CUSTOM_AUDIO_POLICY := 1

# Needed for LPA
COMMON_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=32

# FM
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
TARGET_FM_LEGACY_PATCHLOADER := true
TARGET_QCOM_NO_FM_FIRMWARE := false

# Allow suspend in charge mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Camera
TARGET_NEED_DISABLE_AUTOFOCUS := true
TARGET_NEED_DISABLE_FACE_DETECTION := true
TARGET_NEED_DISABLE_FACE_DETECTION_BOTH_CAMERAS := true

# RIL
COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
BOARD_RIL_CLASS := ../../../device/samsung/loganreltexx/ril/

# CMHW
BOARD_HARDWARE_CLASS += device/samsung/loganreltexx/cmhw

# Legacy MMAP for pre-lollipop blobs
BOARD_USES_LEGACY_MMAP := true

# Enable dex pre-optimization with PIC
WITH_DEXPREOPT := true
WITH_DEXPREOPT_PIC := true