#!/bin/bash

mkdir -p details
for file in `ls whoises`
do
	echo -n "Check file" "$file" "... "

	domain=`echo "$file" | sed "s/.whois.txt//g"`
	> details/details--${domain}.txt

	regurl=`cat whoises/$file | grep '^[ ]*Registrar URL:' | sed 's/[ \t]*Registrar URL:[ \t]*//g'`
	if [ ! -z "$regurl" ]
	then
		echo "find: " $regurl 
		echo "Registrar: $regurl" >> details/details--${domain}.txt
	fi

	regurl=`cat whoises/$file | grep -i '^[ ]*registrar:' | sed 's/[ \t]*registrar:[ \t]*//i'`
	if [ ! -z "$regurl" ]
	then
		echo "find: " $regurl 
		echo "Registrar: $regurl" >> details/details--${domain}.txt
	fi


	regurl=`cat whoises/$file | grep '^[ ]*Referral URL' | sed 's/[ \t]*Referral URL:[ \t]*//g'`
	if [ ! -z "$regurl" ]
	then
		echo "find: " $regurl
		echo "Registrar: $regurl" >> details/details--${domain}.txt
	fi

	regurl=`cat whoises/$file | grep '^[ ]*Sponsoring Registrar:' | sed 's/[ \t]*Sponsoring Registrar:[ \t]*//g'`
	if [ ! -z "$regurl" ]
	then
		echo "find: " $regurl
		echo "Registrar: $regurl" >> details/details--${domain}.txt
	fi


	if [ ! -z "$regurl" ]
	then
		echo "WOW! Didn't find!"
	fi
done