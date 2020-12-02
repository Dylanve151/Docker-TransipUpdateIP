#!/bin/bash
#crontab time

echo "$CRONTIME root php /root/api/UpdateDNSentry.php >> /root/log.log"$'\n' > /etc/cron.d/UpdatePublicIP
