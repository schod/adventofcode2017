#!/bin/bash

echo "declare -A A ">/tmp/x.sh

cat input.txt | \
sed 's#\([a-z]*\) \([a-z]*\) \([-0-9]*\) if \([a-z]*\) \([=><!]*\) \([0-9-]*\)#[ "\${\4:-0}" \5 "\6" ] \&\& let \1=\1@\2@\3 \&\& A[\1]=$\1;#' | \
sed 's/@inc@/+/' | \
sed 's/@dec@/-/' | \
sed 's/--/+/' | \
sed 's/+-/-/' | \
sed 's/==/-eq/' | \
sed 's/!=/-ne/' | \
sed 's/<=/-le/' | \
sed 's/</-lt/' | \
sed 's/>=/-ge/' | \
sed 's/>/-gt/' >> /tmp/x.sh
# echo "declare -p A ">> /tmp/x.sh
echo "printf '%s\n' \"\${A[@]}\"|sort -n | tail -1" >> /tmp/x.sh

bash /tmp/x.sh
