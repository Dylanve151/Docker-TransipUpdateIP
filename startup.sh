#!/bin/bash
#startup script

echo "$domainName" > /verbs/domainName
echo "$dnsEntryNames" > /verbs/dnsEntryNames
echo "$dnsEntryExpire" > /verbs/dnsEntryExpire
echo "$dnsEntryType" > /verbs/dnsEntryType
echo "$TransipUsername" > /verbs/TransipUsername
echo "$WhitelistIPonly" > /verbs/WhitelistIPonly
echo "$PrivateKey" > /verbs/PrivateKey
touch /verbs/prev_publicIP

#fix privatekey
sed -i 's/-----BEGIN PRIVATE KEY----- //' /verbs/PrivateKey
sed -i 's/ -----END PRIVATE KEY-----//' /verbs/PrivateKey
tr " " "\n" < /verbs/PrivateKey > /tmp/PrivateKey && mv /tmp/PrivateKey /verbs/PrivateKey
sed -i '1s/^/-----BEGIN PRIVATE KEY-----\n/' /verbs/PrivateKey
echo '-----END PRIVATE KEY-----' >> /verbs/PrivateKey

#fix DNS entry names
tr -d " " < /verbs/dnsEntryNames > /tmp/dnsEntryNames && mv /tmp/dnsEntryNames /verbs/dnsEntryNames

bash /root/addcronjob.bash
service cron start

tail -fn0 log.log
