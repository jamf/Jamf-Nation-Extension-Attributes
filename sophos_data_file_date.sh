#!/usr/bin/env bash

# Sophos Data File Date
#
#
# This Extension Attribute will read the lastest Data File Date of Sophos

# --------------    edit the variables below this line    ----------------

# Check to see if Sophos is installed
if [ -f "/usr/local/bin/sweep" ]; then
  result=`/bin/date -j -f "%b %d %Y, %T" "$(/usr/local/bin/sweep -v | grep "Data file date" | tail -1 | awk '{print $6, $5, $7, $8}')" "+%Y-%m-%d %T"`
  echo "<result>${result}</result>"
else
  echo "<result>Not installed</result>"
fi
