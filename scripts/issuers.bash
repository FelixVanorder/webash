#!/bin/bash



mkdir -p issuers
for file in `ls whoises`
do
	echo -n "Check file" "$file" "... "

	domain=`echo "$file" | sed "s/.whois.txt//g"`
	> issuers/issuers--${domain}.txt
	host="$domain"

	cat ssl/ssl--${domain}.txt | sed -n -e '/BEGIN\ CERTIFICATE/,/END\ CERTIFICATE/ p' > /tmp/${host}.certs
	openssl x509 -in /tmp/${host}.certs -noout -issuer | sed 's/.*O=\([,a-zA-Z \.-]*\)\/.*/\1/' >> issuers/issuers--${domain}.txt

	cat issuers/issuers--${domain}.txt

done