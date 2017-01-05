#!/bin/bash

android=${PWD}

# selinux: add selinux_status_getenforce to header
cherries+=(60713)

# init: don't skip starting a service with no domain if permissive
cherries+=(142846)

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(1175)

# arm: Allow disabling PIE for dynamically linked executables
cherries+=(2643)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/vendor/cm/build/tools/repopick.py -f -b ${cherries[@]}
fi
