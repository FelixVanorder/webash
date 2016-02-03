#!/bin/bash


echo "<html><head></head><body><table><thead><tr><td>domain</td><td>Mobile Friendly</td><td>Requests For Page</td><td>Page Volume</td><td>Domain Registrar</td><td>Registrar Country</td><td>IP Country Company</td><td>CDN</td><td>Cert Issuer</td><td>Cert Type</td><td>Company Country</td><td>Web Server</td><td>Backend Tech</td><td>Mail Servers</td></tr></thead>"
echo "<tbody><tr>"

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
		ipcountryorg=`echo -n "$ipcountryorg" "$ip&nbsp;$country&nbsp;$org <br ////>"`
	done

	echo -n "<td>http://$domain</td><td>$MobileFriendly</td><td>$RequestsForPage</td><td>$PageVolume</td><td>$DomainRegistrar</td><td>$RegistrarCountry</td><td>$ipcountryorg</td><td>$CDN</td><td>$CertIssuer</td><td>$CertificateType</td><td>$CompanyCountry</td><td>$WebServer</td><td>$BackendTech</td><td>$MailServers</td>"
	echo "</tr>"



done
echo "</tbody></table></body></html>"


