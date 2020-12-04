#!/bin/bash

domainName=$(cat "/verbs/domainName")

dnsEntryNames=($(cat "/verbs/dnsEntryNames" | tr -d ','))
dnsEntryExpire=$(cat "/verbs/dnsEntryExpire")
dnsEntryType=$(cat "/verbs/dnsEntryType")

prev_publicIP=$(cat "/verbs/prev_publicIP")
publicIP=$(curl "http://checkip.amazonaws.com/" 2>/dev/null)

if [ "$prev_publicIP" -ne "$publicIP" ]; then
	dnsEntryValue=$publicIP
	for dnsEntryName in "${dnsEntryNames[@]}"; do
		php UpdateDNSentry.php "$domainName" "$dnsEntryName" "$dnsEntryExpire" "$dnsEntryType" "$dnsEntryValue"
	done
fi
