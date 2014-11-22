#!/bin/bash

android=${PWD}

# sensorservice: Add legacy sensors fusion.
cherries+=(59311)

# vold: allow swapped storage paths at vold init
cherries+=(56515)

# Advanced storage: vold swap storage paths
cherries+=(56516)

# storage: allow swapping primary storage for apps
cherries+=(56950)

# Advanced storage: swap primary storage for apps
cherries+=(56951)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/build/tools/repopick.py -b ${cherries[@]}
fi
