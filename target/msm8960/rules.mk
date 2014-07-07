LOCAL_DIR := $(GET_LOCAL_DIR)

INCLUDES += -I$(LOCAL_DIR)/include -I$(LK_TOP_DIR)/platform/msm_shared

PLATFORM := msm8960

MEMBASE := 0x88F00000 # SDRAM
MEMSIZE := 0x00100000 # 1MB

BASE_ADDR        := 0x80200000

TAGS_ADDR        := BASE_ADDR+0x00000100
KERNEL_ADDR      := BASE_ADDR+0x00008000
RAMDISK_ADDR     := BASE_ADDR+0x01000000
SCRATCH_ADDR     := 0x90000000

KEYS_USE_GPIO_KEYPAD := 1

DEFINES += DISPLAY_SPLASH_SCREEN=1
DEFINES += DISPLAY_TYPE_MIPI=1
DEFINES += DISPLAY_TYPE_HDMI=1
DEFINES += DISPLAY_MIPI_PANEL_RENESAS_HT=1

MODULES += \
	dev/keys \
	dev/pmic/pm8921 \
	dev/ssbi \
	lib/ptable \
	dev/panel/msm \

DEFINES += \
	MEMSIZE=$(MEMSIZE) \
	MEMBASE=$(MEMBASE) \
	BASE_ADDR=$(BASE_ADDR) \
	TAGS_ADDR=$(TAGS_ADDR) \
	KERNEL_ADDR=$(KERNEL_ADDR) \
	RAMDISK_ADDR=$(RAMDISK_ADDR) \
	SCRATCH_ADDR=$(SCRATCH_ADDR)

ifeq ($(LINUX_MACHTYPE_RUMI3), 1)
DEFINES += LINUX_MACHTYPE_RUMI3
endif

OBJS += \
	$(LOCAL_DIR)/init.o \
	$(LOCAL_DIR)/atags.o \
	$(LOCAL_DIR)/keypad.o \
	$(LOCAL_DIR)/target_display.o
