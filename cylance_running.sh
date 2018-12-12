#!/bin/sh

cylance=`ps -ax | grep CylanceSvc`

if [[ "$cylance" =~ CylanceSvc ]]; then
	echo "<result>Running</result>"
else
	echo "<result>Not Running</result>"
fi