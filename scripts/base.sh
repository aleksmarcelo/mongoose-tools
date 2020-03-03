#!/bin/bash

RED=$(tput setaf 1; tput bold)
BELL=$(tput bel)
# GREEN='\e[1;101;37m' # 
GREEN=$(tput setaf 2)
GREENB=$(tput bold;tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 12)
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

# RED='\e[1;49;91m'

BASEDIR=$(dirname "$0")

#GLOBAL FUNCTIONS
sendTerminal()  {
  echo -ne $* | nc -u -w 1 127.0.0.1 55555
}

#Send signals to a process
#$1: name of process
#$2: signal name (SIGSTOP, SIGCONT, SIGTERM)
sendSignal() {
  
pid=$(pidof $1)
if [ -n "$pid" ] 
  then
   echo $NORMAL"Sending ${2} to ${1}"$NORMAL
   kill   -s $2 $pid 
else
   echo "!" #"serial monitor (${1}) not running"
fi
}

