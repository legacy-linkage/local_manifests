#!/bin/bash

android=${PWD}

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(92943)

# sensorservice: Add legacy sensors fusion.
cherries+=(81684)

# arm: Allow disabling PIE for dynamically linked executables
cherries+=(81758)

# Restart WLAN driver after receiving firmware crashed message
cherries+=(89453)

# am: Adjust min free values for low RAM devices
cherries+=(94408)

# policy: Show a simple dialog about optimizing apps
cherries+=(101243)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/build/tools/repopick.py -b ${cherries[@]}
fi
