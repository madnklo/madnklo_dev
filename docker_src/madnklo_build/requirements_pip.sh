#!/bin/bash
################## 
#      PIP
##################


reqs="numpy bidict vegas mpmath pyjet matplotlib ipdb"
for req in $reqs
	do
		pip install $req
	done
	