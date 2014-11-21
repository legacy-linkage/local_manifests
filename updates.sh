#!/bin/bash

android=${PWD}

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(79136)

# core: Add API to retrieve mtu size
cherries+=(79526)

# Add ext2, ext3, and vfat to releasetools
cherries+=(79527)

# libc: Add Scorpion-optimized memcpy and memset
cherries+=(77758)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/build/tools/repopick.py -b ${cherries[@]}
fi
