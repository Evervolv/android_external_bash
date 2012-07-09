# =========================================
# bash configs
# =========================================

LOCAL_PATH := $(call my-dir)

# =========================================
# bashrc
# =========================================
include $(CLEAR_VARS)
LOCAL_MODULE := bashrc
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/bash
LOCAL_SRC_FILES := bashrc
include $(BUILD_PREBUILT)

# =========================================
# bash_logout
# =========================================
include $(CLEAR_VARS)
LOCAL_MODULE := bash_logout
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/bash
LOCAL_SRC_FILES := bash_logout
include $(BUILD_PREBUILT)
