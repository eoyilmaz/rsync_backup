#!/usr/bin/bash
# 
# Backup by E.Ozgur Yilmaz

export RetentionCnt=30
export BackupSource=/mnt/NAS/
export BackupDisk=/mnt/Backup
export BackupTarget=${BackupDisk}/Data/NAS
export GlobalLogFile=${BackupDisk}/backUp.log
export LocalLogFile=${BackupTarget}.0/backUp.log

# Remove the oldest backup
echo Removing the oldest backup folder
for ((i=RetentionCnt;i>5;i--)); do
    # echo Looking for $BackupTarget.$i
    if [ -d $BackupTarget.$i ]; then
	echo Found $BackupTarget.$i as the oldest
        echo Removing $BackupTarget.$i
	rm -Rf $BackupTarget.$i
        break
    fi
done

echo Removed oldest backup folder succesfully!
