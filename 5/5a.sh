#!/bin/bash

function do_magic {
  A=( $( cat $1 ) )
  MAX=${#A[@]}
  I=0
  STEPS=0

  while [ $I -ge 0 ] && [ $I -lt $MAX ]; do
    Ax=${A[I]}
    A[I]=$[${A[$I]}+1]
    I=$[I+Ax]
    STEPS=$[STEPS+1]
  done
  echo $STEPS

}

do_magic input.txt
