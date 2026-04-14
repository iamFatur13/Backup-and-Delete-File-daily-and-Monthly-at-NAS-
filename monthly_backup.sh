
#!/bin/bash

#TODAY=$(date +%Y-%m-%d-%H-%M-%S)
TODAY=$(date +%Y-%m-%d)
DATADIR=/volume1/*
BACKUPDIR=/volume3/Monthly_backup
SCRIPTDIR=/mnt/script_backup
LASTDAYPATH=${BACKUPDIR}/$(ls ${BACKUPDIR} | tail -n 1)
TODAYPATH=${BACKUPDIR}/${TODAY}
if [[ ! -e ${TODAYPATH} ]]; then
        mkdir -p ${TODAYPATH}
fi

#rsync -av --link-dest ${LASTDAYPATH} ${DATADIR} ${TODAYPATH} $@
rsync -avm --exclude-from='/mnt/script_backup/exclude-list.txt' --backup --backup-dir=${LASTDAYPATH} ${DATADIR} ${TODAYPATH} $@

#tar -czvf $TODAY.tar.gz ${DATADIR}
#mv ${DATADIR}${TODAY}.tar.gz ${BACKUPDIR} 

#${SCRIPTDIR}/deleteOldBackups.sh
