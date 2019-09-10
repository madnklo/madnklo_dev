#!/bin/bash
# Author: Johannes Buchner (C) 2015
# For creating a shared library (libcuba.so).

wget www.feynarts.de/cuba/Cuba-4.2.tar.gz
tar -xzf Cuba-4.2.tar.gz
cd Cuba-4.2
./configure --prefix=/home/hep/Cuba-4.2
make; make install;

sed 's/CFLAGS = -O3 -fomit-frame-pointer/CFLAGS = -O3 -fPIC -fomit-frame-pointer/g' --in-place makefile
echo "rebuilding libcuba.a archive"
make -B libcuba.a
echo "unpacking libcuba.a"
FILES=$(ar xv libcuba.a |sed 's/x - //g' |sed 's/__.SYMDEF SORTED//g')
echo $FILES
echo "making libcuba.so"
echo gcc -shared -Wall $FILES -lm  -o libcuba.so
gcc -shared -Wall $FILES -lm  -o libcuba.so
rm $FILES