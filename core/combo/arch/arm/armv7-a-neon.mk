# Configuration for Linux on ARM.
# Generating binaries for the ARMv7-a architecture and higher with NEON
#
ARCH_ARM_HAVE_ARMV7A            := true
ARCH_ARM_HAVE_VFP               := true
ARCH_ARM_HAVE_VFP_D32           := true
ARCH_ARM_HAVE_NEON              := true

ifneq (,$(filter cortex-a15 krait denver,$(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)))
	# TODO: krait is not a cortex-a15, we set the variant to cortex-a15 so that
	#       hardware divide operations are generated. This should be removed and a
	#       krait CPU variant added to GCC/clang.
	arch_variant_cflags := -mcpu=cortex-a15 -mfpu=neon-vfpv4 -mfloat-abi=softfp

	# Fake ARM compiler flags as these processors support LPAE and VFP4 which GCC/clang
	# doesn't advertise.
	arch_variant_cflags += -D__ARM_FEATURE_LPAE=1 -D__ARM_FEATURE_VFP4=1
else
ifeq ($(strip $(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)),cortex-a9)
	arch_variant_cflags := -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=softfp
else
ifneq (,$(filter cortex-a8 scorpion,$(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)))
	arch_variant_cflags := -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp
	arch_variant_ldflags := -Wl,--fix-cortex-a8 
else
ifeq ($(strip $(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)),cortex-a7)
	arch_variant_cflags := -mcpu=cortex-a7 -mfpu=neon -mfloat-abi=softfp
else
	arch_variant_cflags := -march=armv7-a -mfpu=neon -mfloat-abi=softfp
endif
endif
endif
endif

arch_variant_cflags += \
    -mfloat-abi=softfp \
    -mfpu=neon

arch_variant_ldflags := \
	-Wl,--fix-cortex-a8
