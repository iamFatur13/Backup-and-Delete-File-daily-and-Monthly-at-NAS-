#!/bin/bash

pathdaily="/path/daily-backup"
path="/path/log/daily-log/"
timestamp=$(date +%Y%m%d_%H%M%S)
filename=log_$timestamp.txt
log=$path$filename
days=4

if [[ ! -e ${log} ]]; then
        touch -a ${log}
fi

START_TIME=$(date +%s)

STAMP=`date --date="$days day ago" +%Y-%m-%d`
echo "DELETE File Tanggal =$STAMP " >> $log

#find $pathdaily -type -f  -mtime +$days -print  >> $log
ls -l $pathdaily$STAMP >> $log
rm -rf $pathdaily$STAMP  >> $log

echo "Backup:: Script Start -- $(date +%Y%m%d_%H%M)" >> $log

END_TIME=$(date +%s)

ELAPSED_TIME=$(( $END_TIME - $START_TIME ))


echo "Backup :: Script End -- $(date +%Y%m%d_%H%M)" >> $log
echo "Elapsed Time ::  $(date -d 00:00:$ELAPSED_TIME +%Hh:%Mm:%Ss) "  >> $log

