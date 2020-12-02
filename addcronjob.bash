#!/bin/bash
#crontab time

if [ -z "$CRONTIME" ]
then
	echo "* * * * * root php /root/api/UpdateDNSentry.php >> /root/log.log"$'\n' > /etc/cron.d/UpdatePublicIP
else
	echo "$CRONTIME root php /root/api/UpdateDNSentry.php >> /root/log.log"$'\n' > /etc/cron.d/UpdatePublicIP
fi
