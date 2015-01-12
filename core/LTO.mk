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
    libpdfiumcore \
    libstagefright_amrnbdec

ifneq (1,$(words $(filter $(LOCAL_DISABLE_LTO), $(LOCAL_MODULE))))
ifdef LOCAL_CONLYFLAGS
LOCAL_CFLAGS += \
    -flto=jobserver \
    -fuse-linker-plugin \
    -D__LTO__
else
LOCAL_CFLAGS := \
    -flto=jobserver \
    -fuse-linker-plugin \
    -D__LTO__
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += \
    -flto=jobserver \
    -fuse-linker-plugin \
    -D__LTO__
else
LOCAL_CPPFLAGS := \
    -flto=jobserver \
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
