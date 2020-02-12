#!/bin/bash

wget https://lhapdf.hepforge.org/downloads/?f=LHAPDF-6.2.3.tar.gz -O LHAPDF-6.2.3.tar.gz
# ^ or use a web browser to download, which will get the filename correct
tar xf LHAPDF-6.2.3.tar.gz
cd LHAPDF-6.2.3
./configure --prefix=/home/hep/lhapdf/
make
make install
