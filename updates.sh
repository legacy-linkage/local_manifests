#!/bin/bash

android=${PWD}

# sensorservice: Add legacy sensors fusion.
cherries+=(59311)

# audio: Add A2DP notification support
cherries+=(63131)

# framework/av: Add Usb AoA v2.0 support
cherries+=(63410)

# libstagefright: Convert mono to stereo for LPA clips
cherries+=(63411)

# libstagefright: Stability issue with LPA play back.
cherries+=(63412)

# frameworks/av: Fix playback for LPA audio when using gapless api
cherries+=(103480)

# libstagefright: Fix LPA default min duration
cherries+=(103549)

# libstagefright: Disable LPAPlayer verbose logging
cherries+=(103550)

# libstagefright: Update LPAPlayer callbacks
cherries+=(109071)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/build/tools/repopick.py -b ${cherries[@]}
fi
