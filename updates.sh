#!/bin/bash

android=${PWD}

# selinux: add selinux_status_getenforce to header
cherries+=(60713)

# init: don't skip starting a service with no domain if permissive
cherries+=(142846)

# bt: Add LEGACY_BRCM_HCI flag
cherries+=(142721)

# Add LOCAL_NO_FPIE for target executables
cherries+=(159624)

# DO NOT MERGE: Allow disabling PIE for cameraserver
cherries+=(159627)

if [ -z $cherries ]
then
	echo "Nothing to cherry-pick!"
else
	${android}/vendor/cm/build/tools/repopick.py -f -b ${cherries[@]}
fi
