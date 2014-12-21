#!/bin/bash

android=${PWD}

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(79136)

# sensorservice: Add legacy sensors fusion.
cherries+=(81684)

# arm: Allow disabling PIE for dynamically linked executables
cherries+=(81758)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/build/tools/repopick.py -b ${cherries[@]}
fi
