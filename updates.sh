#!/bin/bash

if [ -f ~/bin/paths-11.0.sh ]; then
	source ~/bin/paths-11.0.sh
fi

if [ "${android}" = "" ]; then
	android=~/android/system
fi

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

${android}/build/tools/repopick.py -b ${cherries[@]}
