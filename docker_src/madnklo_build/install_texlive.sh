#!/bin/bash

wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -xzf install-tl-unx.tar.gz
rm install-tl-unx.tar.gz
cd install-tl* 
./install-tl -profile ../texlive.profile
export PATH=/usr/local/texlive/2019/bin/x86_64-linux/:$PATH
tlmgr install type1cm
