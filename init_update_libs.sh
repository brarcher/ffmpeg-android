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

wget -O- https://ftp.osuosl.org/pub/blfs/conglomeration/libpng/libpng-1.6.21.tar.xz | tar xJ
wget -O- http://downloads.sourceforge.net/project/expat/expat/2.1.0/expat-2.1.0.tar.gz | tar xz
wget -O- http://pkgs.fedoraproject.org/repo/pkgs/fribidi/fribidi-0.19.7.tar.bz2/6c7e7cfdd39c908f7ac619351c1c5c23/fribidi-0.19.7.tar.bz2 | tar xj
wget -O- http://sourceforge.net/projects/lame/files/lame/3.99/lame-3.99.5.tar.gz | tar xz
echo "============================================"

