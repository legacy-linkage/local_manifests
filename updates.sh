#!/bin/bash

android=${PWD}

# sensorservice: Add legacy sensors fusion.
cherries+=(59311)

# Revert "audioflinger: fix static track end detection"
cherries+=(108644)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/build/tools/repopick.py -b ${cherries[@]}
fi
