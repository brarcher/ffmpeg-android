[FFmpeg-Android](http://hiteshsondhi88.github.io/ffmpeg-android/) [![Build Status](https://travis-ci.org/brarcher/ffmpeg-android.svg?branch=master)](https://travis-ci.org/brarcher/ffmpeg-android)
==============

* FFmpeg for Android compiled with x264, libass, fontconfig, freetype and fribidi
* Supports Android L
* [FFmpeg Android Library](https://github.com/brarcher/ffmpeg-android-java)

Supported Architecture
----
* armv7
* x86

Instructions
----
* Set environment variable
  1. export ANDROID_NDK={Android NDK Base Path}
* Run following commands to compile ffmpeg
  1. sudo apt-get --quiet --yes install build-essential git autoconf libtool pkg-config gperf gettext yasm python-lxml
  2. ./init_update_libs.sh
  3. ./android_build.sh
* To update submodules and libraries you can use ./init_update_libs.sh command
* Find the executable binary in build directory.
* If you want to use FONTCONFIG then you need to specify your custom fontconfig config file (e.g - "FONTCONFIG_FILE=/sdcard/fonts.conf ./ffmpeg --version", where /sdcard/fonts.conf is location of your FONTCONFIG configuration file).

License
----
  check files LICENSE.GPLv3 and LICENSE
