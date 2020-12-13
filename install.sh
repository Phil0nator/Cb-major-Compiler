#!/bin/bash

# check for permission
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# check for python
which python3
if ["$0" -ne 0]
    then echo "Please first install python (version 3.6 or later)."
    exit
fi

# check for pip
which pip3
if ["$0" -ne 0]
    then echo "Please first install a pip version for python 3."
    exit
fi

# setup dependencies
pip3 install argparse
pip3 install colorama
pip3 install termcolor
pip3 install cpuid



mkdir /lib/cbm
cp -r -v * /lib/cbm
ln -s /lib/cbm/cbm.sh /bin/cbm