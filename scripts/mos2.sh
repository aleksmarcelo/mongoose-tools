#!/bin/bash

source "${0%/*}/base.sh"


#STOP PICOCOM
sendTerminal "\n\r${GREEN}TERMINAL PAUSED... ${NORMAL} ";
sendSignal picocom SIGSTOP
# pgrep picocom | xargs kill -q -s SIGSTOP 

#Flashing

echo Executing \"mos $* \"
sleep 1
stty -F /dev/ttyUSB? 921600
mos  $*  2>&1 | sed -e  "  \
    s/\(^Error.*\)/$RED\1$NORMAL/gI;   \
    s/\(^Setting new.*\)/$GREEN\1$NORMAL/gI;   \
    "  
#RESTART PICOCOM
sendSignal picocom SIGCONT   
stty -F /dev/ttyUSB? 115200
sendTerminal "${GREEN}TERMINAL RESTARTED AGAIN!   $NORMAL  \r\n" ;