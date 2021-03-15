TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = Discord
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = discordvideoloop

discordvideoloop_FILES = Tweak.xm
discordvideoloop_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
