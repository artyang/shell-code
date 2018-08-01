#!/bin/sh
#In security compliance environments ensures syslog is always running
#Run from crontab every 1 minute
log=/var/log/syslog-check.log
if ! pgrep -x "syslog-ng" > /dev/null
then
  echo "daemon is stopped - restarting -- $(date %Y%m%d_%H%M)" >> $log
  /bin/service syslog-ng start
else
  #echo "daemon is running - no action -- $(date %Y%m%d_%H%M)" >> $log
fi
