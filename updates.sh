#!/bin/bash

android=${PWD}

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(79136)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/build/tools/repopick.py -b ${cherries[@]}
fi
