#!/bin/sh

# Created by Scott Birdsley (sbirdsley@gmail.com)
# to detect version of DisplayLink installed on OS X

if [ -f "/Library/Extensions/DisplayLinkDriver.kext/Contents/Info.plist" ] ; then
	VERSION=$( defaults read "/Library/Extensions/DisplayLinkDriver.kext/Contents/Info.plist" CFBundleVersion )
else
	VERSION="Not installed."
fi

echo "<result>$VERSION</result>"
