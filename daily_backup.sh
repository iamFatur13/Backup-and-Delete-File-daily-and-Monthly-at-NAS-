
#!/bin/bash


TODAY=$(date +%Y-%m-%d)
DATADIR=/path/sumber/data/*
BACKUPDIR=/path/tujuan/backup
SCRIPTDIR=/mnt/script_backup
LASTDAYPATH=${BACKUPDIR}/$(ls ${BACKUPDIR} | tail -n 1)
TODAYPATH=${BACKUPDIR}/${TODAY}
if [[ ! -e ${TODAYPATH} ]]; then
        mkdir -p ${TODAYPATH}
fi

rsync -av --exclude-from='/mnt/script_backup/exclude-list.txt' --link-dest ${LASTDAYPATH} ${DATADIR} ${TODAYPATH} $@


