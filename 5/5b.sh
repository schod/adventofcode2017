#!/bin/bash

function do_magic {
  A=( $( cat $1 ) )
  MAX=${#A[@]}
  I=0
  STEPS=0

  while [[ $I -ge 0 && $I -lt $MAX ]]; do
    Ax=${A[I]}

    if [[ $Ax -ge 3 ]]; then
      A[I]=$[${A[$I]}-1]
    else
      A[I]=$[${A[$I]}+1]
    fi

    I=$[I+Ax]
    STEPS=$[STEPS+1]
  done
  echo $STEPS

}

do_magic test_input.txt
do_magic input.txt
