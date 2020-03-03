#!/bin/bash

source "${0%/*}/base.sh"

SPACES="\u20\u20"


#FILE EXISTS ?
if [ ! -f $1 ]; then
    echo -e "\n${RED}File $1 does not exist!${NORMAL}\n"
    exit 0;
fi

#STOP PICOCOM
sendSignal picocom SIGSTOP

# echo Stoping Serial Monitor...
sendTerminal "\n\r${RED}TERMINAL STOPPED!${NORMAL}";


#TRANSFER FILES
printf "Sending $# file(s): \n"
sendTerminal "\r\n${NORMAL}Receiving $# file(s): ${NORMAL}";
for var in "$@"
do
    lasttime=$SECONDS
    echo "    " $var  
    sendTerminal "\r\n \u237B${SPACES}${YELLOW}$var ${NORMAL}";

    mos  --baud-rate  115200  put $var 2> /dev/null
    time=$(( $SECONDS - $lasttime ))

    sendTerminal "\r \u2714${SPACES}${GREEN}$var ${NORMAL} \t\t ${time}s";
done

#RESTART SERIAL AND REBOOT ESP32
echo Rebooting...
sendTerminal "\r\n${RED}REBOOTING MCU  ${NORMAL}\n\r" ;
sendSignal picocom SIGCONT
mos call Sys.Reboot 2&> /dev/null


#SHOW TIME CONSUMED
duration=$SECONDS
echo $YELLOW"Elapsed time:   $(($duration / 60)) minutes and $(($duration % 60)) seconds"$NORMAL
echo