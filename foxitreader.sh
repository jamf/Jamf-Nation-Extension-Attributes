#!/bin/sh

#
# by sbirdsley 07-10-2017
# checks for Foxit Version
#

if [ -d /Applications/Foxit\ Reader.app ] ; then
	RESULT=$( sudo defaults read /Applications/Foxit\ Reader.app/Contents/Info CFBundleShortVersionString )
	echo "<result>$RESULT</result>"
else
	echo "<result>Not Installed</result>"
fi
