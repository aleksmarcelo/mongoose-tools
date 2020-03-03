
#!/bin/bash
source ~/.bashrc

export scripts="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# export scripts=$MOS_SCRIPTS
echo "BASH TWEAKED." #scripts in ${scripts}."


#shopt -s expand_aliases

# ALIASES
alias build=${scripts}/build.sh
alias serial=${scripts}/serial.sh
alias flash=${scripts}/flash.sh
alias put=${scripts}/put.sh
alias mos2=${scripts}/mos2.sh
alias watch=${scripts}/watch.sh
alias watchfs='watch fs'

echo "  build            -   local build"
echo "  serial           -   starts serial monitor"
echo "  flash            -   flash firmware"
echo "  mos2             -   same as mos, but pausing serial monitor"
echo "  put              -   send a file to MCU filesystem"
echo "  watch [folder]   -   watch files changes in the folder specified"
echo "  watchfs          -   watch files changes in fs folder"
echo "  esp32            -   show esp32 pinout configuration"