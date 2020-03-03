#!/bin/bash

# sets process name
me=`basename "$0"`

GREEN='\e[0;101;37m' 
NORMAL=$(tput sgr0)

echo -en "${GREEN}INITIALIZING MESSAGE SERVICE ${NORMAL}\n\r"
nc -l -u -k   127.0.0.1 55555 


trap "killall nc;echo STOPED\n\r" SIGKILL;
trap "echo 'killink nc';killall nc" EXIT


while true
do
  sleep 1; 
done
