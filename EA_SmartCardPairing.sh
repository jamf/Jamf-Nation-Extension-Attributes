#!/bin/sh

##########################################
# Start Card Pairing Status					 
# Extension Attribute	 				 
# Josh Harvey | Jul 2017				 
# josh[at]macjeezy.com 				 	 
# GitHub - github.com/therealmacjeezy    
# JAMFnation - therealmacjeezy			 
##########################################

############################### Notes ##################################
# This Extension Attribute can be used to pull the Smart Card pairing 
# status
#
########### ISSUES / USAGE #############################################
# If you have any issues or questions please feel free to contact  	    
# using the information in the header of this attribute                   
#																		
# Also, Please give me credit and let me know if you are going to use   
# this script. I would love to know how it works out and if you find    
# it helpful.  														    
########################################################################

# Finds the current logged in user and sets it as a variable to be used later in the script
currentUser=`who | grep "console" | cut -d" " -f1`

# Finds the status of the Smart Card pairing UI. If the computer is running macOS 10.11 it will pull back a status of N/A
uiStatus=`sudo su - "$currentUser" -c "/usr/sbin/sc_auth pairing_ui -s status"`

osVersion=`sw_vers -productVersion | grep -e "10.12"`

if [[  -z "$osVersion" ]];
    then
        echo "<result>N/A (macOS 10.12 Required)</result>"
elif [[ "$uiStatus" == "SmartCard Pairing dialog is disabled." ]];
    then
        echo "<result>Disabled</result>"
else
        echo "<result>Enabled</result>"
fi