#!/bin/bash

android=${PWD}

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/build/tools/repopick.py -b ${cherries[@]}
fi
