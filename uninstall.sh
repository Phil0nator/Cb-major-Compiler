#!/bin/bash

# check for permission
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


# remove main directory
rm /lib/cbm -r
# remove symbolic link
rm /bin/cbm
