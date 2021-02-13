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
python3 -m pip install python-Levenshtein
python3 -m pip install llist

# linux_installer contains all of the linux-specific operations
function linux_installer(){

  # handle assembler dependency
  sudo apt-get install nasm


  mkdir /usr/lib/cbm
  # copy files
  cp -a -r -v * /usr/lib/cbm
  # create symbolic link for terminal command
  ln -s /usr/lib/cbm/cbm.sh /usr/bin/cbm
}

# the osx_installer contains all of the osx-specific operations
function osx_installer(){
  
  # handle assembler dependency
  which nasm
  # if nasm isn't installed:
  if [ "$0" -ne 0 ]; then
    
    which brew
    # if brew isn't installed:
    if [ "$0" -ne 0 ]; then 
      echo "Please either install NASM (Netwide Assembler) yourself, or install brew so that this script can install it."
      exit;
    fi
    # install nasm with brew
    sudo -u $SUDO_USER "brew" "install" "nasm";

  fi

  # create a bin folder in home
  mkdir ~/bin
  # create a source folder for CBM
  mkdir ~/bin/cbmsrc
  # copy the project
  cp -v -R -p * ~/bin/cbmsrc
  # create a symbolic link in /usr/local/bin called cbm for the terminal command
  ln -s ~/bin/cbmsrc/cbm.sh /usr/local/bin/cbm
  

  # update the bash script to work on osx
  echo '
  #!/usr/bin/env bash
  python3 ~/bin/cbmsrc/compile.py "$@"
  ' >> ~/bin/cbmsrc/cbm.sh
  
  # setup executable permissions
  # (755 means executable by normal users, and root)
  chmod 755 ~/bin/cbmsrc/cbm.sh
  chmod 755 /usr/local/bin/cbm


}



# now system dependant operations will be done depending
# on weather the system is MacOs or Linux GNU
case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  osx_installer ;; 
  linux*)   linux_installer ;;
  bsd*)     echo "BSD" ;;
  msys*)    echo "WINDOWS" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac
