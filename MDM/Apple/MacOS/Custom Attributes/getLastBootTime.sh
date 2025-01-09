#!/bin/bash

############################################################################################
##
## Extension Attribute script to return last boot time
##
############################################################################################

date -jf "%s" "$(sysctl kern.boottime | awk -F'[= |,]' '{print $6}')" +"%Y-%m-%d %T"