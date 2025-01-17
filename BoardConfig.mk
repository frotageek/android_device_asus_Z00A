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

# inherit from common mofd-common
-include device/asus/mofd-common/BoardConfigCommon.mk

# Mkbootimg
BOARD_BOOT_KEY := $(DEVICE_PATH)/keys/boot_z00a.sig
BOARD_RECOVERY_KEY := $(DEVICE_PATH)/keys/recovery_z00a.sig

# Partitions
BOARD_USERDATAIMAGE_PARTITION_SIZE := 59261286400

## Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Require Ifwi version
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt

# Use the non-open-source parts, if they're present
-include vendor/asus/Z00A/BoardConfigVendor.mk
