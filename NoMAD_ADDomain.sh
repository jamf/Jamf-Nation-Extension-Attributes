#!/bin/sh
echo "<result>`defaults read /Library/Preferences/com.trusourcelabs.NoMAD.plist | grep -i addomain | awk '{print $NF}' | tr -d '"' | tr -d ';'`</result>"
