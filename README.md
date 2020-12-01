# docker-scheduledwol
deploy:
```
docker build --name="" --restart="always" --volume="/etc/localtime:/etc/localtime:ro" --network="host"  dylanve115/
```
## Environment variables:
### Required:

CRONTIME = Set the time in CRONTAB to schedule the wakeup script. (Example: "0 12 * * *" starts wakeup script everyday on 12:00).

### Optional:


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
