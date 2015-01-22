# Copyright (C) 2014 The SaberMod Project
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

ifeq ($(STRICT_ALIASING),true)

LOCAL_DISABLE_STRICT := \
	adbd \
	libcutils \
	liblog \
	libstlport_static \
	libjemalloc \
	init \
	libc_tzcode \
	libfs_mgr \
	libziparchive \
	libtwrpmtp \
	libcrypto \
	libminivold \
	libext4_utils \
	libfusetwrp \
	libguitwrp \
	busybox \
	libuclibcrpc \
	libziparchive-host \
	libpdfiumcore \
	libandroid_runtime \
	libpdfiumcore \
	libpdfium \
	bluetooth.default \
	logd \
	bu_recovery \
	libminzip \
	mdnsd \
	net_net_gyp \
	libbusybox \
	libfusesideload \
	libstagefright_webm \
	libaudioflinger \
	libmediaplayerservice \
	libstagefright \
	ping \
	ping6 \
	libdiskconfig \
	libjavacore \
	libfdlibm \
	libvariablespeed \
	librtp_jni \
	libwilhelm \
	libdownmix \
	libldnhncr \
	libqcomvisualizer \
	libvisualizer \
	libstlport \
	libutils \
	dnsmasq \
	static_busybox \
	libwebviewchromium \
	libwebviewchromium_loader \
	libwebviewchromium_plat_support \
	content_content_renderer_gyp \
	third_party_WebKit_Source_modules_modules_gyp \
	third_party_WebKit_Source_platform_blink_platform_gyp \
	third_party_WebKit_Source_core_webcore_remaining_gyp \
	third_party_angle_src_translator_lib_gyp \
	third_party_WebKit_Source_core_webcore_generated_gyp \
	libc_gdtoa \
	libext4_utils_static \
	libselinux \
	libvold \
	libext2fs \
	recovery_e2fsck \
	libc_openbsd \
	recovery_tune2fs \
	libext2_blkid \
	libcrypto_static \
	libc \
	libfuse \
	libsdcard \
    camera.msm8084 \
	libc_nomalloc

# Force no strict-aliasing on some modules
LOCAL_FORCE_DISABLE_STRICT := \
	libziparchive-host \
	libziparchive \
	libdiskconfig \
	logd \
	libjavacore

ifeq (1,$(words $(filter $(LOCAL_FORCE_DISABLE_STRICT),$(LOCAL_MODULE))))
ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += \
	-fno-strict-aliasing
else
LOCAL_CONLYFLAGS := \
	-fno-strict-aliasing
endif
ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += \
	-fno-strict-aliasing
else
LOCAL_CPPFLAGS := \
	-fno-strict-aliasing
endif
endif

# Test local module disabled list.
ifneq (1,$(words $(filter $(LOCAL_DISABLE_STRICT),$(LOCAL_MODULE))))
ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += \
	-fstrict-aliasing \
	-Werror=strict-aliasing
else
LOCAL_CONLYFLAGS := \
	-fstrict-aliasing \
	-Werror=strict-aliasing
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += \
	-fstrict-aliasing \
	-Werror=strict-aliasing
else
LOCAL_CPPFLAGS := \
	-fstrict-aliasing \
	-Werror=strict-aliasing
endif
ifdef LOCAL_CLANG
LOCAL_CONLYFLAGS += \
	-Wstrict-aliasing=3
LOCAL_CPPFLAGS += \
	-Wstrict-aliasing=3
else
LOCAL_CONLYFLAGS += \
	-Wstrict-aliasing=2
LOCAL_CPPFLAGS += \
	-Wstrict-aliasing=2
endif
endif

else
# Force no strict-aliasing on some modules
LOCAL_FORCE_DISABLE_STRICT := \
	libziparchive-host \
	libziparchive \
	libdiskconfig \
	logd \
	libjavacore

ifeq (1,$(words $(filter $(LOCAL_FORCE_DISABLE_STRICT),$(LOCAL_MODULE))))
ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += \
	-fno-strict-aliasing
else
LOCAL_CONLYFLAGS := \
	-fno-strict-aliasing
endif
ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += \
	-fno-strict-aliasing
else
LOCAL_CPPFLAGS := \
	-fno-strict-aliasing
endif
endif
endif

#####
