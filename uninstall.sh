#!/bin/bash

# check for permission
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi



rm /lib/cbm -r
rm /bin/cbm