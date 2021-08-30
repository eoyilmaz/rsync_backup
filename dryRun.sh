#/bin/sh
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

export RetentionCnt=30
export BackupSource=/mnt/NAS/
export BackupDisk=/mnt/Backup
export BackupTarget=${BackupDisk}/Data/NAS


# link and copy and backup
rsync -avuhn --progress --delete-excluded --delete --filter="merge filter_rules" $BackupSource $BackupTarget.0/ | tee ./whatToBackup

echo "Dry Run Completed!"

