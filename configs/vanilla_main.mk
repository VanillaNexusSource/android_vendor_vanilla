# Copyright (C) 2016 The Pure Nexus Project
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

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/vanilla/overlay/common

# Main Required Packages
PRODUCT_PACKAGES += \
    LiveWallpapersPicker

# Custom Packages
PRODUCT_PACKAGES += \
    ThemeInterfacer \
    OmniJaws

# ThemeInterfacer sig check override
# Default value is false
# Setting to true so that my debug APKs get recognized without toggling the
# switch in Advanced Settngs. Plus I don't care about security :P
PRODUCT_PROPERTY_OVERRIDES += \
    ro.interfacer.buildtype.check=true

# Google Prebuilts
PRODUCT_PACKAGES += \
    GBoard \
    GoogleWallpapers \
    PixelLauncher

# Build Pixel things if requested
ifeq ($(PIXEL),true)
    PRODUCT_PACKAGES += PixelLauncherIcons

    PRODUCT_PACKAGE_OVERLAYS += \
        vendor/vanilla/overlay/pixel

    # Set Pixel blue light theme on Gboard
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.ime.theme_id=5
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/vanilla/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/vanilla/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/vanilla/prebuilt/bin/50-base.sh:system/addon.d/50-base.sh

# For stereo widening effect
ifneq ($(TARGET_NO_DSPMANAGER), true)
    PRODUCT_PACKAGES += \
        libcyanogen-dsp \
        audio_effects.conf
endif
