#!/bin/bash

grep -Eo  --color "class=([!-z]*('|\"))"  $1 > classes
grep -Eo "('|\")[!-z]*\1" classes | sed 's/^.//g' | sed 's/.$//g'  > nomes
sed 's/^/./' nomes | sed 's/$/ {/g' > seletores
for s in $(sed 's/ {/{/g' seletores); do
	echo -e "$s\n $(cat skeleton.css)\n}"; done | sed 's/{$/ {/' > style.css
