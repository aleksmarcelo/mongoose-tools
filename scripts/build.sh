#!/bin/bash
source "${0%/*}/base.sh"

SECONDS=0  #to count the time



# --no-libs-update : Não atualiza as libs --platform esp32/esp8266 (mos.yml)
 mos build $1  --no-libs-update  \
  --deps-dir deps   \
  --binary-libs-dir LIBS \
 --local --repo ~/zephyr/mongoose-os \
 --verbose  \
 2>&1 \
 | sed -e "s/\(^.*Error.*\)/$RED\1$NORMAL/gI; \
 s/\(^.*undefined.*\)/$RED\1$NORMAL/gI; \
 s/\(^.*fetch.*\)/$YELLOW\1$NORMAL/gI; \
 s/\(^.*cloning .*\)/$YELLOW\1$NORMAL/gI; \
 s/\(^.*note: .*\)/$YELLOW\1$NORMAL/gI; \
 s/\(^.*Success.*\)/$GREEN\1$NORMAL/gI;  \
 s/\(^.*Firmware saved.*\)/$GREEN\1$NORMAL/gI; "

duration=$SECONDS
echo
echo $YELLOW"Elapsed time:   $(($duration / 60)) minutes and $(($duration % 60)) seconds"$NORMAL
echo
echo -ne "remember: $BLUE'build --clean'$NORMAL makes a clean build "; sleep 1
echo -ne "\n\n"