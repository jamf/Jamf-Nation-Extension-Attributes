#!/bin/sh

##########################################
# Encrypted Volume Password				 
# Extension Attribute	 				 
# Josh Harvey | Jul 2017				 
# josh[at]macjeezy.com 				 	 
# GitHub - github.com/therealmacjeezy    
# JAMFnation - therealmacjeezy			 
##########################################

############################### Notes ##################################
# This Extension Attribute can be used to pull the encoded password for
# the external volume. The password is encoded with base64 and will 
# require you to use the command below to decode it:
# echo "encoded password" | base64 -D
#
# Before using this EA, you must replace the path to the log file with 
# the one used in the Encrypted Volume Password script
#
########### ISSUES / USAGE #############################################
# If you have any issues or questions please feel free to contact  	    
# using the information in the header of this attribute                   
#																		
# Also, Please give me credit and let me know if you are going to use   
# this script. I would love to know how it works out and if you find    
# it helpful.  														    
########################################################################

# Pulls the passphrase from the log created during encryption
getPassphrase=`cat /path/to/log.file`

if [[ -z "$getPassphrase" ]];
    then
        echo "<result>N/A</result>"
else
        echo "<result>$getPassphrase</result>"
fi