#!/bin/bash

android=${PWD}

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(117733)

# arm: Allow disabling PIE for dynamically linked executables
cherries+=(123032)

# policy: Show a simple dialog about optimizing apps
cherries+=(131627)

# Barrier only messages shouldn't prevent the idle handlers from running
cherries+=(131628)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/build/tools/repopick.py -f -b ${cherries[@]}
fi
