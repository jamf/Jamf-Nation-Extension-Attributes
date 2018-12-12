#!/bin/sh

# Hardcoded home/profile directories to exclude
declare -a ExcludedHOMEDIRs=('.localized' 'Shared' 'admin')

# Get home/profile directories list
HomeDIRs=`ls /Users`

# Loop through /Users directory
for HOME in $HomeDIRs ; do
# If a hardcoded exclusion, don't process
if echo ${ExcludedHOMEDIRs[@]} | grep -q -w -v "$HOME"; then
	# Read LastUser value
	NoMADUserInPlistInLoop=$(defaults read /Users/$HOME/Library/Preferences/com.trusourcelabs.NoMAD.plist LastUser)
	# Check if LastUser has a value
	if [[ ! -z "$NoMADUserInPlistInLoop" ]]; then
		# Add local user to array then NoMAD LastUser value to array
		LocalUserToNoMADUser=( "${LocalUserToNoMADUser[@]}" "LocalAcc:$HOME => NoMADUser:$NoMADUserInPlistInLoop")
	else
		# Add local user to array then NoMAD EMPTY value to array
		LocalUserToNoMADUser=( "${LocalUserToNoMADUser[@]}" "LocalAcc:$HOME => NoMADUser:")
	fi
fi
done
echo "<result>$(printf '%s\n' "${LocalUserToNoMADUser[@]}")</result>"
