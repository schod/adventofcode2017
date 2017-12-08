#!/bin/bash

cat input.txt | \
sed 's#\([a-z]*\) \([a-z]*\) \([-0-9]*\) if \([a-z]*\) \([=><!]*\) \([0-9-]*\)#[ "\${\4:-0}" \5 "\6" ] \&\& let \1=\1@\2@\3; echo $\1#;' | \
sed 's/@inc@/+/' | \
sed 's/@dec@/-/' | \
sed 's/--/+/' | \
sed 's/+-/-/' | \
sed 's/==/-eq/' | \
sed 's/!=/-ne/' | \
sed 's/<=/-le/' | \
sed 's/</-lt/' | \
sed 's/>=/-ge/' | \
sed 's/>/-gt/' > /tmp/x.sh

bash /tmp/x.sh |sort -n |tail -1
