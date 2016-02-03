#!/bin/bash

mkdir -p mx
for file in `ls whoises`
do
	echo -n "Check file" "$file" "... "
	domain=`echo "$file" | sed "s/.whois.txt//g"`

	> mx/${domain}.txt

	MXs=`dig +tcp +short -t MX $domain @8.8.8.8`
	for mx in "$MXs"
	do
		echo "$mx" >> mx/${domain}.txt	
	done
done