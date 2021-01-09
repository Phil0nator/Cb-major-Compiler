#!/usr/bin/env bash


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
which python3 -m pip
if ["$0" -ne 0]
    then echo "Please first install a pip version for python 3."
    exit
fi

# setup dependencies

# argparse is used to parse commandline arguments passed to the compiler
python3 -m pip install argparse
# colorama and termcolor are used for text formatting in errors and warnings
# to give ansii encoded colors and styles.
python3 -m pip install colorama
python3 -m pip install termcolor

# cpuid is used to get basic information about the cpu and what feature sets
# it has available.
python3 -m pip install cpuid



# now system dependant operations will be done depending
# on weather the system is MacOs or Linux GNU

if ["$(uname)" == "Darwin"]; then
  # MacOs X
  brew install nasm




else
  # Linux GNU
  # satisfy assembler dependency 
  sudo apt-get install nasm

fi

  mkdir /usr/lib/cbm
  # copy files
  cp -a -r -v * /usr/lib/cbm
  # create symbolic link for terminal command
  ln -s /usr/lib/cbm/cbm.sh /usr/bin/cbm