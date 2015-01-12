#Xile's Modular Fast Math Implementation


LOCAL_DISABLE_FM := \
    libstlport_static \
    libandroid_runtime \
    libandroidfw \
    libicuuc \
    libhwui \
    libpdfiumcore \
    libpdfium \
    libstagefright_amrnb_common \
    bluetooth.default \
    third_party_sqlite_sqlite_gyp \
    libart-compiler \
    conscrypt \
    libjavacore \
    libstlport

ifneq (1,$(words $(filter $(LOCAL_DISABLE_FM), $(LOCAL_MODULE))))
ifdef LOCAL_CONLYFLAGS
LOCAL_CFLAGS += \
    -ffast-math
else
LOCAL_CFLAGS := \
    -ffast-math
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += \
    -ffast-math
else
LOCAL_CPPFLAGS := \
    -ffast-math
endif
endif

#####
