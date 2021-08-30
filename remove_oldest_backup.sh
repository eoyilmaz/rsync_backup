#!/usr/bin/bash
# 
# Backup by E.Ozgur Yilmaz

source config.sh
source print_vars.sh

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
