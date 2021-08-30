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

source config.sh
source print_vars.sh

# link and copy and backup
rsync -avuhn --progress --delete-excluded --delete --filter="merge filter_rules" $BackupSource $BackupTarget.0/ | tee ./whatToBackup

echo "Dry Run Completed!"
