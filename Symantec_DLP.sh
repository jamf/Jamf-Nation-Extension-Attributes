#!/bin/sh
#
############################################################################
#
#  Created by Claudio Higuchi
#  Created on 6/17/17
#  Extension Attribute checks if Symantec DLP is installed.
#
############################################################################
#

if [ -f "/Library/Manufacturer/Endpoint Agent/Resources/info.plist" ] ; then
 	VERSION=$( defaults read "/Library/Manufacturer/Endpoint Agent/Resources/info.plist" CFBundleShortVersionString )
 else
 	VERSION="Not installed."
fi

 echo "<result>$VERSION</result>"