#!/usr/bin/bash
# 
# Backup by E.Ozgur Yilmaz

source config.sh
source print_vars.sh

# Remove the latest backup
echo Removing latest backup: $BackupTarget.0
rm -rf $BackupTarget.0

echo Cascade previous backup folders
for ((i=1;i<RetentionCnt;i++)); do
    echo $BackupTarget.$i \-\> $BackupTarget.$((i-1))
    mv $BackupTarget.$i $BackupTarget.$((i-1))
done

echo Removed latest backup folder succesfully!
