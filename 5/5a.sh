#!/bin/bash

function do_magic {
  A=( $( < $1 ) )
  MAX=${#A[@]}
  I=0
  STEPS=0

  while [[ ${A[I]} ]]; do
    Ax=${A[I]}
    A[I]=$[${A[$I]}+1]
    I=$[I+Ax]
    STEPS=$[STEPS+1]
  done
  echo $STEPS

}

do_magic input.txt
