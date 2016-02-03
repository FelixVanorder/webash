#!/bin/bash



mkdir -p ipwho
for ip in `find ipwho/* | xargs grep --color ERROR | sed 's/.txt.*//' | sed 's/ipwho\///'`
do
	echo "Check IP" "$ip" "... "

	#echo $plainips
	whois $ip 2>/dev/null | tee ipwho/${ip}.txt | grep ERROR

done
