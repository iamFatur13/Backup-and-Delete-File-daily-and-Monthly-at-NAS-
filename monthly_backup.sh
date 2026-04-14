
#!/bin/bash

#TODAY=$(date +%Y-%m-%d-%H-%M-%S)
TODAY=$(date +%Y-%m-%d)
DATADIR=/path/sumber/data/yang/akan/di/backup/*
BACKUPDIR=/path/tujuan/backup
LASTDAYPATH=${BACKUPDIR}/$(ls ${BACKUPDIR} | tail -n 1)
TODAYPATH=${BACKUPDIR}/${TODAY}
if [[ ! -e ${TODAYPATH} ]]; then
        mkdir -p ${TODAYPATH}
fi

rsync -avm --exclude-from='/mnt/script_backup/exclude-list.txt' --backup --backup-dir=${LASTDAYPATH} ${DATADIR} ${TODAYPATH} $@

