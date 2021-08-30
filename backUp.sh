#!/usr/bin/bash
# 
# Backup by E.Ozgur Yilmaz
# 
# Backs up the harddrives with versioned directories.
#

source config.sh
source print_vars.sh

# Create TimeStamp for Backup start date
echo Backup Started at:   $BackupStartDate | tee $TempLocalLogFile >> $GlobalLogFile
echo Backing up $BackupSource to $BackupTarget.0

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

echo Running rsync command in quiet mode
/usr/bin/rsync -avuh --progress --delete-excluded --delete --filter="merge filter_rules" $BackupSource $BackupTarget.0/ | tee -a $TempLocalLogFile


# Create TimeStamp for Backup end date
echo Backup Completed at: `date +"%Y%m%d-%H%M"` | tee -a $TempLocalLogFile >> $GlobalLogFile
echo "==================================" >> $GlobalLogFile

# Move the TempLocalLogFile to LocalLogFile
mv $TempLocalLogFile $LocalLogFile

echo "Backup Completed"
