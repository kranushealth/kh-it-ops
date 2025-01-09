#!/bin/bash
#set -x

############################################################################################
##
## Extension Attribute script to return IP Address
##
############################################################################################

ip_address=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}')

echo $ip_address