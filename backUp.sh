#!/usr/bin/bash
# 
# Backup by E.Ozgur Yilmaz
# 
# Backs up the harddrives with versioned directories.
# 
# Changelog
# ---------
# 
# 0.1.0
# -----
# - Added support to disable suspend
#

# There is a problem with cygwin, where it is not possible to hard-link files
# it is complaining about different file systems, while the files are on the
# same drive

export RetentionCnt=30
export BackupSource=/mnt/NAS/
export BackupTarget=/mnt/Backup/Data/NAS
export LogFile=/mnt/Backup/backUp.log
export LogStampFile=$BackupTarget.0/backUp.log

# Create TimeStamp for Backup start date
echo Backup Started at:   `date +"%Y%m%d-%H%M"` >> $LogFile
echo Backing up $BackupSource to $BackupTarget.0

# Also create a file showing the backup date in to the BackupTarget folder
rm $LogStampFile
echo

# Remove the oldest backup
echo Removing oldest backup: $BackupTarget.$RetentionCnt
rm -rf $BackupTarget.$RetentionCnt

echo Cascade previous backup folders
for ((i=RetentionCnt-1;i>=0;i--)); do
    echo $BackupTarget.$i \-\> $BackupTarget.$((i+1))
    mv $BackupTarget.$i $BackupTarget.$((i+1))
done

echo Link and Copy $BackupTarget.0
cp -rl $BackupTarget.1 $BackupTarget.0
#/usr/bin/rsync -avuh --progress --delete-excluded --delete --filter="merge filter_rules" $BackupSource $BackupTarget.0/
echo Running rsync command in quiet mode
/usr/bin/rsync -avuh -q --delete-excluded --delete --filter="merge /mnt/Backup/filter_rules" $BackupSource $BackupTarget.0/ >> $TimeStampFile

# Create TimeStamp for Backup end date
echo Backup Completed at: `date +"%Y%m%d-%H%M"` >> $LogFile
echo "==================================" >> $LogFile
echo "Backup Completed"


