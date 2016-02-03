#!/bin/bash



mkdir -p ipwho
for file in `ls ips`
do
	echo "Check file" "$file" "... "

	plainips=`cat ips/$file | sed 's/IP: //'`
	#echo $plainips
	for ip in $plainips
	do
		echo "check IP " $ip
		whois $ip > ipwho/${ip}.txt
	done

done
