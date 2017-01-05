#!/bin/bash

android=${PWD}

# sensorservice: Add legacy sensors fusion.
cherries+=(70355)

# audio: Add A2DP notification support
cherries+=(63465)

# framework/av: Add Usb AoA v2.0 support
cherries+=(63464)

# libstagefright: Convert mono to stereo for LPA clips
cherries+=(63463)

# libstagefright: Stability issue with LPA play back.
cherries+=(63462)

# frameworks/av: Fix playback for LPA audio when using gapless api
cherries+=(63573)

# libstagefright: Fix LPA default min duration
cherries+=(63572)

# libstagefright: Disable LPAPlayer verbose logging
cherries+=(63571)

# libstagefright: Update LPAPlayer callbacks
cherries+=(63478)

# input: Set explicit ioprio
cherries+=(67360)

# surfaceflinger: Set explicit ioprio where required
cherries+=(70229)

# display: Set thread priority using cutils
cherries+=(75249)

# hwc: Set ioprio for vsync thread
cherries+=(75248)

# Set IO scheduler using persist property
cherries+=(130381)

# cutils: Squashed backport of BFQIO cgroups support
cherries+=(143080)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/.repo/local_manifests/repopick.py -b ${cherries[@]}
fi
