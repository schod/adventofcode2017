#!/bin/bash

function do_magic {
  RET=0
  while read L; do
    MIN=$(echo $L | sed 's/ /\n/g' | sort -n | head -1)
    MAX=$(echo $L | sed 's/ /\n/g' | sort -n | tail -1)
    let RET=RET+$MAX-$MIN
  done <$1
  echo $RET
}

do_magic test_input_a.txt
do_magic input_a.txt
