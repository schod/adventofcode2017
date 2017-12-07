#!/bin/bash

function do_magic {
  declare -A A

  while read P _ _ CHs; do
    if [ "$CHs" ]; then
      for CH in ${CHs//,/}; do
        A[$CH]=$P
      done
    fi
  done <$1

  ROOT=$(echo ${!A[@]}|sed 's/ .*//g')

  while [ ${A[$ROOT]} ] ; do
    ROOT=${A[$ROOT]}
  done
  echo $ROOT
}

do_magic test_input.txt
do_magic input.txt
