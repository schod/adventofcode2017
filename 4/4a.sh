#!/bin/bash

function do_magic {
  RET=0
  while read L; do
    C=$(echo $L | tr ' ' '\n' | sort | uniq -c | sed 's/^[ ]*//' | grep -v '^1' | wc -l)
    [ $C -eq 0 ] && let RET=RET+1
  done <$1
  echo $RET
}

do_magic input.txt
