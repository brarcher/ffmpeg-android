#!/bin/bash

echo "============================================"
echo "Updating submodules"
git submodule update --init
echo "============================================"
echo "Updating libpng, expat and fribidi"
rm -rf libpng-*
rm -rf expat-*
rm -rf fribidi-*
rm -rf lame-*
rm -rf libuuid-*

wget -O- https://download.sourceforge.net/libpng/libpng-1.6.35.tar.xz | tar xJ
wget -O- https://github.com/libexpat/libexpat/releases/download/R_2_2_6/expat-2.2.6.tar.bz2 | tar xj
wget -O- https://github.com/fribidi/fribidi/releases/download/v1.0.5/fribidi-1.0.5.tar.bz2 | tar xj
wget -O- https://sourceforge.net/projects/lame/files/lame/3.100/lame-3.100.tar.gz | tar xz
wget -O- https://sourceforge.net/projects/libuuid/files/libuuid-1.0.3.tar.gz | tar xz
echo "============================================"

