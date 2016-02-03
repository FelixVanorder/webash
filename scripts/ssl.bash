#!/bin/bash


mkdir -p ssl
for file in `ls whoises`
do
	echo -n "Check file" "$file" "... "

	domain=`echo "$file" | sed "s/.whois.txt//g"`
	> ssl/ssl--${domain}.txt
	host="$domain"


	openssl s_client \
		-CApath /etc/ssl/certs/ \
		-verify_return_error \
		-verify 5 \
		-servername $host \
		-connect ${host}:443 \
		-no_ssl2 -no_ssl3 \
		-showcerts \
			</dev/null \
			2>/dev/null \
			> ssl/ssl--${domain}.txt
			# | sed -n -e '/BEGIN\ CERTIFICATE/,/END\ CERTIFICATE/ p' > /tmp/${host}.certs
	#perl cert-split.pl /tmp/${host}.certs

	sslresult=$?
	echo "result session status: $sslresult" | tee -a ssl/ssl--${domain}.txt

done




