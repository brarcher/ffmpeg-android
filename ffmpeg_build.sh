#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd ffmpeg

ASM_OPTION=""
YASM_OPTION="--enable-yasm"

case $1 in
  armeabi-v7a | armeabi-v7a-neon)
    CPU='cortex-a8'
  ;;
  x86)
    CPU='i686'
    # Some assembly has text relocations, and cannot execute on
    # later Android systems.
    ASM_OPTION="--disable-asm"
    YASM_OPTION="--disable-yasm"
  ;;
  arm64)
    CPU='cortex-a57'
  ;;
esac

make clean

./configure \
--target-os="android" \
--cross-prefix="$CROSS_PREFIX" \
--arch="$NDK_ABI" \
--cpu="$CPU" \
--enable-runtime-cpudetect \
--sysroot="$NDK_SYSROOT" \
--enable-pic \
--enable-libx264 \
--enable-libass \
--enable-libfreetype \
--enable-libfribidi \
--enable-libmp3lame \
--enable-fontconfig \
--enable-pthreads \
--disable-debug \
--disable-ffserver \
--disable-network \
--disable-filters \
--enable-filter=fps \
--enable-filter=split \
--enable-filter=palettegen \
--enable-filter=fifo \
--enable-filter=paletteuse \
--enable-version3 \
--enable-hardcoded-tables \
--disable-ffplay \
--enable-ffprobe \
--enable-gpl \
${ASM_OPTION} \
${YASM_OPTION} \
--disable-doc \
--disable-shared \
--enable-static \
--pkg-config="${2}/ffmpeg-pkg-config" \
--prefix="${2}/build/${1}" \
--extra-cflags="-I${TOOLCHAIN_PREFIX}/include $CFLAGS" \
--extra-ldflags="-L${TOOLCHAIN_PREFIX}/lib $LDFLAGS" \
--extra-libs="-lpng -lexpat -lm" \
--extra-cxxflags="$CXX_FLAGS" || exit 1

make -j${NUMBER_OF_CORES} && make install || exit 1

popd
