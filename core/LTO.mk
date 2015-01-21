#--------------------
#-                  -
#- |    ----- ----- -
#- |      |   |   | -
#- |___   |   |___| -
#-                  -
#--------------------
#
#Xile's Modular LTO Implementation

LOCAL_DISABLE_LTO := \
    libjemalloc \
    libm \
    libz \
    libbatteryservice \
    liblog \
    libdl \
    minivold \
    libsuspend \
    libmincrypt \
    libutils \
    libstdc++ \
    libadf \
    libbinder \
    libc_common \
    libcompiler_rt-extras \
    libfs_mgr \
    adbd \
    libsysutils \
    mkfs.f2fs \
    healthd \
    libpdfiumcore \
    libext2_blkid \
    libhealthd.default \
    libext4_utils_static \
    libcutils \
    libminivold \
    libselinux \
    libminshacrypt \
    libminui \
    libstlport_static \
    libext2_uuid_static \
    liblogwrap \
    libf2fs_fmt \
    init

ifneq (1,$(words $(filter $(LOCAL_DISABLE_LTO), $(LOCAL_MODULE))))
ifdef LOCAL_CFLAGS
LOCAL_CFLAGS += \
    -flto=jobserver \
    -fuse-linker-plugin \
    -fno-toplevel-reorder \
    -D__LTO__
else
LOCAL_CFLAGS := \
    -flto=jobserver \
    -fno-toplevel-reorder \
    -fuse-linker-plugin \
    -D__LTO__
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += \
    -flto=jobserver \
    -fno-toplevel-reorder \
    -fuse-linker-plugin \
    -D__LTO__
else
LOCAL_CPPFLAGS := \
    -flto=jobserver \
    -fno-toplevel-reorder \
    -fuse-linker-plugin \
    -D__LTO__
endif

ifdef LOCAL_LDFLAGS
LOCAL_LDFLAGS += \
    -Wl,-flto
else
LOCAL_LDFLAGS := \
    -Wl,-flto
endif
endif

#####
