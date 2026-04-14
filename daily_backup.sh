
#!/bin/bash

#TODAY=$(date +%Y-%m-%d-%H-%M-%S)
TODAY=$(date +%Y-%m-%d)
DATADIR=/volume1/*
BACKUPDIR=/volume2/Daily_backup
SCRIPTDIR=/mnt/script_backup
LASTDAYPATH=${BACKUPDIR}/$(ls ${BACKUPDIR} | tail -n 1)
TODAYPATH=${BACKUPDIR}/${TODAY}
if [[ ! -e ${TODAYPATH} ]]; then
        mkdir -p ${TODAYPATH}
fi

rsync -av --exclude-from='/mnt/script_backup/exclude-list.txt' --link-dest ${LASTDAYPATH} ${DATADIR} ${TODAYPATH} $@

#${SCRIPTDIR}/delete_old.sh
