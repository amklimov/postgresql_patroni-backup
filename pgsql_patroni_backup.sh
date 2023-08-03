#!/usr/bin/env bash

LEADER="sudo /usr/local/bin/patronictl list | grep -i Leader | awk '{print $2}'"
DATE=`date +%F_%H.%M`
DIR="/opt/backup/database"
a=(Base1 Base2 Base3)

for DB in ${a[@]} 
do 
    pg_dump -U postgres $LEADER -j 4 -v -Fd $DB -f  $DIR/$DB'_'$DATE  &>$DIR/$DB'_'$DATE.log
    find $DIR -ctime +30 | xargs rm -rf
done
