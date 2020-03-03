#!/bin/bash 

source "${0%/*}/base.sh"

echo "dir script: "$scripts
while (true)
do

  sleep 2;
  files=`find $1 -type f -mmin 0,2 -print`  #other countries must use 0.2
  
  if [ ! -z "$files" ]
  then
    echo  $files updated
    ${scripts}/put.sh $files
  fi  

done