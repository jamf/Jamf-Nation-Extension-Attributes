#!/usr/bin/python

# Copyright (c) 2017 University of Utah Student Computing Labs. ################
# All Rights Reserved.
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby granted,
# provided that the above copyright notice appears in all copies and
# that both that copyright notice and this permission notice appear
# in supporting documentation, and that the name of The University
# of Utah not be used in advertising or publicity pertaining to
# distribution of the software without specific, written prior
# permission. This software is supplied as is without expressed or
# implied warranties of any kind.
################################################################################

# attached_displays.py #########################################################
#
# A Python script/Jamf Pro Extension Attribute to inventory and report on
# attached displays.
#
#    1.0.0  2017.09.08      Initial release. tjm
#
################################################################################

# Notes ########################################################################
#
# The output is set up to split three times. Once on ':' will give you the count
# of displays and the description string. And then splitting the description
# string on ':' will give you individual displays. Finally on ',' will give
# features.  You can also split the resolution if you need to, for height,
# width, etc.
#
# 2: Built-in, Retina, iMac, 2560 x 1440 (5120 x 2880); Primary, ASUS VH236H, 1920 x 1080 @ 60 Hz (1920 x 1080)
#  ^                                                  ^
#  | 1. split on ':"                                  |
#                                                     | 2. split on ';'
# Continue spliting on ',' for indiviual features
# Current resolution is displayed, Maximum resolution available in parentheses
#
################################################################################

from __future__ import print_function
import subprocess
import plistlib


def main():
    count_displays = 0
    master_string = ""

    raw_displays = subprocess.check_output(["system_profiler", "SPDisplaysDataType", "-xml"])
    plist_displays = plistlib.readPlistFromString(raw_displays)
    list_of_displays = plist_displays[0]['_items']

    for item in list_of_displays:
        sublist = item['spdisplays_ndrvs']
        count_displays = str(len(sublist))

        for subitem in sublist:
            feature_list = []

            try:
                name_string = subitem['_name']
            except:
                name_string = ""

            # Build list of resolution string
            try:
                resolution_string = subitem['_spdisplays_resolution']
            except:
                resolution_string = ""

            try:
                resolution_string = resolution_string + " (" + subitem['_spdisplays_pixels'] + ")"
            except:
                resolution_string = resolution_string + ""

            # Build list of individual features
            try:
                display_type = subitem['spdisplays_display_type']
            except:
                display_type = ""

            try:
                display_main_raw = subitem['spdisplays_main']
                if 'yes' in display_main_raw:
                    feature_list.append("Primary")
            except:
                pass

            if 'built' in display_type:
                feature_list.append("Built-in")

            if 'retina' in display_type:
                feature_list.append("Retina")

            if 'spdisplays_on' in subitem['spdisplays_mirror']:
                feature_list.append("Mirrored")

            output_string = name_string + ", " + ", ".join(feature_list) + ", " + resolution_string

            if master_string:
                master_string = master_string + "; " + output_string
            else:
                master_string = output_string

    master_string = count_displays + ": " + master_string
    print("<result>" + master_string + "</result>")


if __name__ == '__main__':
    main()
