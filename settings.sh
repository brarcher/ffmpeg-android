#!/bin/bash

SUPPORTED_ARCHITECTURES=(armeabi-v7a x86)
ANDROID_NDK_ROOT_PATH=${ANDROID_NDK}
if [[ -z "$ANDROID_NDK_ROOT_PATH" ]]; then
  echo "You need to set ANDROID_NDK environment variable, please check instructions"
  exit
fi
ANDROID_API_VERSION=24
NDK_TOOLCHAIN_ABI_VERSION=4.9

NUMBER_OF_CORES=1
which nproc >/dev/null
if [ $? -eq 0 ]; then
   NUMBER_OF_CORES=$(nproc)
fi
if [ $NUMBER_OF_CORES -eq 1 ]; then
   # Attempt to determine cores if running on macOS
   which sysctl >/dev/null
   if [ $? -eq 0 ]; then
      NUMBER_OF_CORES=$(sysctl -n hw.ncpu)
   fi
fi

HOST_UNAME=$(uname -m)
TARGET_OS=linux

CFLAGS='-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fno-strict-overflow -fstack-protector-all'
LDFLAGS='-Wl,-z,relro -Wl,-z,now -pie'

FFMPEG_PKG_CONFIG="$(pwd)/ffmpeg-pkg-config"
