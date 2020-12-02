# docker-scheduledwol
deploy:
```
docker build --name="transipupdateip" --restart="always" --volume="/etc/localtime:/etc/localtime:ro" dylanve115/transipupdateip
```
## Environment variables:
### Required:
domainName = Your domain name
dnsEntryNames = name of DNS entry you want to update
dnsEntryExpire = TTL of the DNS entry
dnsEntryType = Type of the DNS entry
TransipUsername = Your transip login username
WhitelistIPonly = if true will create a api access token that only works form whitelisted ip addresses
PrivateKey = private key from transip api. (paste as copied from transip website.)

### Optional:
CRONTIME = Set the time in CRONTAB to schedule the wakeup script. (Example: "0 12 * * *" starts wakeup script everyday on 12:00).

## Example of CRONTIME definition:
```
.---------------- minute (0 - 59)
|  .------------- hour (0 - 23)
|  |  .---------- day of month (1 - 31)
|  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
|  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
|  |  |  |  |
*  *  *  *  *
```
