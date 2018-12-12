#!/bin/sh

IFS=$'\n'

# Hardcoded home/profile directories to exclude
declare -a ExcludedProfiles=('.localized' 'Shared' 'admin')

# Get home/profile directories list
HomeDIRs=`ls /Users`

# Define variable/array for do loop to append to
NoMADUserListLoop=()

# Loop through /Users directory
for HOME in $HomeDIRs ; do
# If a hardcoded exclusion, don't process
if echo ${ExcludedProfiles[@]} | grep -q -w -v "$HOME"; then
	# Define current NoMADUser variable in loop
	NoMADUserInLoop=$()
	# Check if current home/profile directory has com.trusourcelabs.NoMAD.plist file
	if [[ -f "/Users/$HOME/Library/Preferences/com.trusourcelabs.NoMAD.plist" ]]; then
		# Read LastUser value
		NoMADUserInLoop=$(defaults read /Users/$HOME/Library/Preferences/com.trusourcelabs.NoMAD.plist LastUser)
		# Check if LastUser has a value
		if [[ ! -z "$NoMADUserInLoop" ]]; then
			# Add LastUser value to array and add trailing comma
			NoMADUserListLoop=( "${NoMADUserListLoop[@]}" "$NoMADUserInLoop"",")
		fi
	fi
fi
done

# Make array into string and omit last comma
NoMADUserList=$(echo ${NoMADUserListLoop[@]} | sed '$s/.$//')

# Return / submit NoMAD list to JSS
echo "<result>`echo $NoMADUserList`</result>"
