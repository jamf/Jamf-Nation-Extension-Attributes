#!/bin/sh

#Check to see if Cisco AnyConnect is installed
file=/Library/Application\ Support/OpenDNS\ Roaming\ Client/dns-updater

if [[ -f "$file" ]]; then
    result=$("$file" --version)
    echo "<result>$result</result>"
else
    echo "<result>Not installed</result>"
fi
