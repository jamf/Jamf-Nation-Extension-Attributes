#!/bin/sh

##########################################
# Rename Startup Volume					 
# Extension Attribute	 				 
# Josh Harvey | Jul 2017				 
# josh[at]macjeezy.com 				 	 
# GitHub - github.com/therealmacjeezy    
# JAMFnation - therealmacjeezy			 
##########################################

############################### Notes ##################################
# This Extension Attribute can be used to pull the Volume Name from the
# startup volume.
########### ISSUES / USAGE #############################################
# If you have any issues or questions please feel free to contact  	    
# using the information in the header of this attribute                   
#																		
# Also, Please give me credit and let me know if you are going to use   
# this script. I would love to know how it works out and if you find    
# it helpful.  														    
########################################################################

# Finds the current boot volume
bootVolume=`/usr/sbin/bless --info --getboot`

# Uses the variable above to pull the name of the boot volume
bootVolumeName=`/usr/sbin/diskutil info $bootVolume | grep "Volume Name" | sed 's/.*://g' | awk '{$1=$1};1'`

# Sets the Volume Name as the text for the Extension Attribute
if [[ -z "$bootVolumeName" ]];
	then
		echo "<result>Volume Name Unavailable</result>"
	else
		echo "<result>$bootVolumeName</result>"
fi