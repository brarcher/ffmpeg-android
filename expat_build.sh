#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd expat-2.1.0

make clean

case $1 in
  armeabi-v7a | armeabi-v7a-neon | arm64)
    HOST='arm-linux'
  ;;
  x86)
    HOST='i686-linux'
  ;;

esac

./configure \
  --with-pic \
  --with-sysroot="$NDK_SYSROOT" \
  --host="$HOST" \
  --enable-static \
  --disable-shared \
  --prefix="${TOOLCHAIN_PREFIX}" || exit 1

make -j${NUMBER_OF_CORES} install || exit 1
