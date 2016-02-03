#!/bin/bash -e


mkdir -p whoises
for domain in `cat domains.txt`
do
	echo $domain
	whois $domain > whoises/$domain.whois.txt 2>/dev/null # | grep -i 'registrar' # '\(Registrar: \|Registrar \)'
done