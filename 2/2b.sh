#!/bin/bash

function do_magic {
  RET=0
  while read L; do # Per line
    for N in $L; do # Per number
      for M in $L; do # for each number
        if [ $N -ne $M ]; then # different number :)
          if [ $[$N % $M] -eq 0 ]; then # division is a whole number
            let RET=RET+N/M # add
          fi
        fi
      done
    done
  done <$1
  echo $RET # TADA
}

do_magic test_input_b.txt
do_magic input_b.txt
