#!/bin/bash


echo "||= site =||= Mobile Friendly =||= Requests For Page =||= Page Volume =||= Domain Registrar =||= Registrar Country =||= IP Country Company =||= CDN =||= Cert Issuer =||= Cert Type =||= Company Country =||= Web Server =||=  Backend Tech =||= Mail Servers =||"

for file in `ls whoises`
do
	#echo -n "Check file" "$file" "... "

	domain=`echo "$file" | sed "s/.whois.txt//g"`
	host="$domain"

	MobileFriendly="?"
	RequestsForPage="?"
	PageVolume="?"
	DomainRegistrar=`cat details/details--${domain}.txt | sed 's/Registrar: //'`
	RegistrarCountry="?"
	IPs=`cat ips/ips-${domain}.txt | sed 's/IP: //'`
	ServerCompany="?"
	ServerCountry="?"
	CDN="?"
	CertIssuer=`cat issuers/issuers--${domain}.txt`
	CertificateType="?"
	CompanyCountry="?"
	WebServer="?"
	BackendTech="?"
	MailServers=`cat mx/${domain}.txt`

	ipcountryorg=""
	for ip in $IPs
	do
		country=`cat ipwho-short/$ip.txt | grep 'Country: ' | sed 's/Country: //'`
		org=`cat ipwho-short/$ip.txt | grep 'Org: ' | sed 's/Org: //'`
		ipcountryorg=`echo -n "$ipcountryorg" "$ip $country $org \\\\\\\\"`
	done

	echo -n "||= http://$domain =||= $MobileFriendly =||= $RequestsForPage =||= $PageVolume =||= $DomainRegistrar =||= $RegistrarCountry =||= $ipcountryorg =||= $CDN =||= $CertIssuer =||= $CertificateType =||= $CompanyCountry =||= $WebServer =||=  $BackendTech =||= $MailServers =||" | perl -p -e 's/\n/ \\\\ /'
	echo



done