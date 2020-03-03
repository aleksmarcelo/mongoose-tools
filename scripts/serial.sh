#!/bin/bash
#********************************************************************************
#**
#** serial.sh
#**
#** Apresenta a conexão com a seria sendo que toda linha contendo a palavra erro será colocada em vermelho
#**
#** Use C-A C-X para sair C=control
#**
#********************************************************************************
source "${0%/*}/base.sh"
# me=`basename "$0"`

# RED=$(tput bold;tput setaf 1)
# NORMAL=$(tput sgr0)
# bell=$(tput bel)
# GREEN=$(tput setaf 2)
# pid= `pidof $(me)`
clear 

echo "$0" 
echo
echo "Remember ${GREEN}Ctrl-A Ctrl-x${NORMAL}  to exit"
echo
sleep 3

$BASEDIR/serialaux.sh  &



grepc()
{
  pattern=$1
  shift
  esc=$(printf "\033")
  sed 's"'"now"'"'$esc'[32m&'$esc'[0m"g' "$@"
}



usb=`ls /dev/ttyUSB?`
echo "Conecting to ${usb}"


# trap 'echo warnUpdate' STOP
trap "killall serialaux.sh; killall nc" EXIT



restartTerm() {
  stty -F /dev/ttyUSB? 115200
  picocom  --nolock  --echo --imap lfcrlf -b 115200 /dev/ttyUSB?  \
     | sed -e "s/\(^.*Error.*\)/$RED\1$NORMAL/gI"
}



restartTerm


