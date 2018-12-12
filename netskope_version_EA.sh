#!/bin/bash
# netskope_version_EA.sh
# Written by: Patrick Gallagher
# Updated: 08/24/2018

if [[ -f /Library/Application\ Support/Netskope/STAgent/Netskope\ Client.app/Contents/Info.plist ]]; then
  vers=$(/usr/bin/defaults read /Library/Application\ Support/Netskope/STAgent/Netskope\ Client.app/Contents/Info.plist CFBundleShortVersionString)
  echo "<result>$vers</result>"
else
  echo "<result></result>"
fi
