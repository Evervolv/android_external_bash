LOCAL_PATH:= $(call my-dir)

# ========================================================
# bash
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	shell.c eval.c y.tab.c general.c make_cmd.c print_cmd.c \
	dispose_cmd.c execute_cmd.c variables.c copy_cmd.c error.c \
	expr.c flags.c jobs.c subst.c hashcmd.c hashlib.c mailcheck.c \
	trap.c input.c unwind_prot.c pathexp.c sig.c test.c version.c \
	alias.c array.c arrayfunc.c assoc.c braces.c bracecomp.c \
	bashhist.c bashline.c list.c stringlib.c locale.c findcmd.c \
	redir.c pcomplete.c pcomplib.c syntax.c xmalloc.c
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/lib
LOCAL_CFLAGS += \
	-DHAVE_CONFIG_H \
	-DPROGRAM=\"bash\" \
	-DPACKAGE=\"bash\" \
	-DCONF_HOSTTYPE=\"arm\" \
	-DCONF_OSTYPE=\"android-eabi\" \
	-DCONF_MACHTYPE=\"arm-android-eabi\" \
	-DCONF_VENDOR=\"unknown\" \
	-DLOCALEDIR=\"/data/locale\" \
	-DSHELL
LOCAL_SHARED_LIBRARIES += \
	libncurses
LOCAL_STATIC_LIBRARIES += \
	libbuiltins \
	libglob \
	libsh \
	libtilde \
	libhistory \
	libreadline \
	libclearsilverregex
LOCAL_MODULE := bash
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

LOCAL_MODULE_TAGS := eng

include $(BUILD_EXECUTABLE)

# ========================================================
# /bin/bash symlink for gnu script compatiblility
# ========================================================
BASH_SYMLINKS := $(TARGET_ROOT_OUT_BIN)/$(LOCAL_MODULE)
#BASH_SYMLINKS += $(TARGET_OUT_EXECUTABLES)/$(LOCAL_MODULE)
$(BASH_SYMLINKS): BASH_BINARY := $(LOCAL_MODULE)
$(BASH_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Symlink: $@ -> $(BASH_BINARY)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/xbin/$(BASH_BINARY) $@

ALL_DEFAULT_INSTALLED_MODULES += $(BASH_SYMLINKS)

ALL_MODULES.$(LOCAL_MODULE).INSTALLED += $(BASH_SYMLINKS)

# ========================================================
include $(call all-makefiles-under,$(LOCAL_PATH))
