#!/bin/bash

mkdir -p ips
for file in `ls whoises`
do
	echo -n "Check file" "$file" "... "
	domain=`echo "$file" | sed "s/.whois.txt//g"`

	> ips/ips-${domain}.txt

	ips=`dig +tcp +short $domain @8.8.8.8`
	for ip in $ips
	do
		echo "IP: $ip" >> ips/ips-${domain}.txt	
	done
done