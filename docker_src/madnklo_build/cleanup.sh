#!/bin/bash

delete_list="/home/hep/LHAPDF-6.2.3.tar.gz
/home/hep/install_lhapdf.sh
/var/tmp/install-tl-*
/home/hep/install_texlive.sh
/home/hep/texlive.profile
/home/hep/install_cuba.sh
/home/hep/Cuba-4.2.tar.gz"

for element in $delete_list
do
	rm -rf $element
done