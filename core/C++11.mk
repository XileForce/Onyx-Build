
LOCAL_DISABLE_C++11 := \
    libbinder \
    libaapt \
    libhwui \
    libnativehelper \
    androidfw \
    libandroidfw \
    libandroid_runtime \
    libaapt_32

ifneq (1,$(words $(filter $(LOCAL_DISABLE_C++11), $(LOCAL_MODULE))))
ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += \
    -std=gnu++11
else
LOCAL_CPPFLAGS := \
    -std=gnu++11
endif
endif

#####
