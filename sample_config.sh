#!/usr/bin/bash
# 
# Backup by E.Ozgur Yilmaz
# 
# Backs up the harddrives with versioned directories.

export RetentionCnt=30
export BackupSource=/mnt/NAS/
export BackupDisk=/mnt/Backup
export BackupTarget=${BackupDisk}/Data/NAS
export BackupStartDate=`date +"%Y%m%d-%H%M"`

# Log Files
export GlobalLogFile=${BackupDisk}/backUp.log
export TempLocalLogFile=${BackupDisk}/LocalBackUp.log
export LocalLogFile=${BackupTarget}.0/backUp.log
