#!/bin/bash
source "${0%/*}/base.sh"

# RED='\e[1;49;91m'
# BLUE='\e[7;49;96m'
# NORMAL=$(tput sgr0)


if [ ! -f "./build/fw.zip" ]; then
    echo -e "\n${RED}Flash File does not exist!${NORMAL}\n"
    exit 0;
fi


# sendTerminal()  {
#   echo -ne $* | nc -u -w 1 127.0.0.1 55555
# }


#STOP PICOCOM
sendSignal picocom SIGSTOP
echo Stoping Serial Monitor...
sendTerminal "\n\r${RED}TERMINAL STOPPED!${NORMAL}";


#FLASH
echo Flashing 
sendTerminal "\r\n${BLUE}Flashing new firmware...${NORMAL}";
stty -F /dev/ttyUSB? 115200
mos flash 2>&1 | sed -e  "\
    s/\(^All done.*\)/$GREEN\1$NORMAL/gI;   \
    s/\(^Running flasher.*\)/$GREEN\1$NORMAL/gI"
stty -F /dev/ttyUSB? 115200

sendTerminal '\b\b\b   ok'

#REBOOT ESP32w
echo Rebooting...
sendTerminal "\r\n${RED}REBOOTING MCU  ... ${NORMAL}" ;

#RESTART PICOCOM 
sendSignal picocom SIGCONT   

