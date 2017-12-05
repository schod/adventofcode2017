    #!/bin/bash

    function do_magic {
      RET=0
      while read L; do
        HASH=""
        for P in $L; do
          H=$(echo $P | sed 's/\(.\)/\1\n/g' | grep -v "^$" | sort | uniq -c |sed 's/[ ]//g' | tr -d '\n')
          HASH=$(printf "$H\n$HASH")
        done
        UNIQ=$(echo "$HASH"|sort|uniq -c | grep -v "^ *1 " | wc -l)
        [ $UNIQ -eq 0 ] && let RET=RET+1
      done <$1
      echo $RET
    }

    do_magic input.txt
