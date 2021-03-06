#!/bin/bash

domainName=$CERTBOT_DOMAIN

dnsEntryName='_acme-challenge'
dnsEntryExpire=300
dnsEntryType='TXT'
dnsEntryValue="$CERTBOT_VALIDATION"

cur_dnsEntryValue=""

php UpdateDNSentry.php "$domainName" "$dnsEntryName" "$dnsEntryExpire" "$dnsEntryType" "$dnsEntryValue"

while [[ "${cur_dnsEntryValue}" != *"${dnsEntryValue}"* ]]; do
	cur_dnsEntryValue=$(dig -t txt _acme-challenge.velst.nl +short)
	sleep 10
done
