#!/bin/sh
image_sign=`cat /etc/config/image_sign`
mkdir -p /var/servd
xmldb -n $image_sign -t > /dev/console &
servd -d schedule_off > /dev/console 2>&1 &
sleep 1
/etc/scripts/dbload.sh
service LOGD start
echo "1" > /proc/sys/kernel/panic
exit 0
