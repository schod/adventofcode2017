#!/bin/bash

function do_magic {
  A=( $( < $1 ) ) # TODO zkusit
  MAX=${#A[@]}
  declare -i I
  declare -i STEPS
  declare -i Ax
  I=0
  STEPS=0

  while [[ ${A[I]} ]]; do
    Ax=${A[I]}

    if [[ $Ax -ge 3 ]]; then
      A[I]=$[${A[$I]}-1]
    else
      A[I]=$[${A[$I]}+1]
    fi

    I=I+Ax
    STEPS=STEPS+1
  done
  echo $STEPS

}

do_magic test_input.txt
do_magic input.txt
