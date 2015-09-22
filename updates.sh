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

# policy: Show a simple dialog about optimizing apps
cherries+=(101243)

# build: Add option to disable block-based ota
cherries+=(102837)

# libstagefright: Add legacy LPAPlayer
cherries+=(103507)

# audio: Add A2DP notification support
cherries+=(103509)

# framework/av: Add Usb AoA v2.0 support
cherries+=(103510)

# libstagefright: Convert mono to stereo for LPA clips
cherries+=(103511)

# libstagefright: Stability issue with LPA play back.
cherries+=(103512)

# frameworks/av: Fix playback for LPA audio when using gapless api
cherries+=(103513)

# libstagefright: Disable LPAPlayer verbose logging
cherries+=(103556)

# libstagefright: Update LPAPlayer callbacks
cherries+=(109096)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/build/tools/repopick.py -f -b ${cherries[@]}
fi
