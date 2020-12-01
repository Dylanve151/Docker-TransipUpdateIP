#!/bin/bash
#startup script

#bash /root/addcronjob.bash

echo "$dnsEntryNames" > /verbs/dnsEntryNames
echo "$dnsEntryExpire" > /verbs/dnsEntryExpire
echo "$dnsEntryType" > /verbs/dnsEntryType
echo "$TransipUsername" > /verbs/TransipUsername
echo "$WhitelistIPonly" > /verbs/WhitelistIPonly
echo "$PrivateKey" > /verbs/PrivateKey

#if [ -z "$TRIGGER_IP" ]
#then
#	echo "No Trigger IP" >> log.log
#else
#	echo "$TRIGGER_IP" > /verbs/TRIGGER_IP
#fi
#service cron start
tail -fn0 log.log
