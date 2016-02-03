#!/bin/bash



mkdir -p ipwho-short
for file in `ls ipwho`
do
	echo "Check file $file ..."

	country=`cat ipwho/$file | grep -i '^[ \t]*Country:' | head -1 | sed 's/[ \t]*Country:[ \t]*//i'`
	org=`cat ipwho/$file | grep -i '^[ \t]*Organization:' | head -1 | sed 's/[ \t]*Organization:[ \t]*//i'`
	if [ -z "$org" ]
	then
		org=`cat ipwho/$file | grep -i '^[ \t]*Owner:' | head -1 | sed 's/[ \t]*Owner:[ \t]*//i'`
	fi
	if [ -z "$org" ]
	then
		org=`cat ipwho/$file | grep -i '^[ \t]*NetName:' | head -1 | sed 's/[ \t]*NetName:[ \t]*//i'`
	fi

	echo "Country: $country" > ipwho-short/$file
	echo "Org: $org" >> ipwho-short/$file

done
