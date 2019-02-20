#!/bin/bash


LOG_FILE=/repos/html/logs/repo_sync_$(date +%Y.%m.%d).log

# Remove old logs
find /repos/html/logs/repo_sync* -mtime +5 -delete; >> $LOG_FILE 2>&1

# Sync repositories
/usr/bin/reposync --newest-only --repoid=rhel-7-server-rpms -p /repos/html/Redhat/ >> $LOG_FILE 2>&1
/usr/bin/reposync --newest-only --repoid=rhel-7-server-optional-rpms -p /repos/html/Rhel7-optional >> $LOG_FILE 2>&1
/usr/bin/reposync --newest-only --repoid=rhel-ha-for-rhel-7-server-rpms -p /repos/html/HighAvailability/ >> $LOG_FILE 2>&1 
/usr/bin/reposync --newest-only --repoid=rhel-rs-for-rhel-7-server-rpms -p /repos/html/ResilientStorage/ >> $LOG_FILE 2>&1
/usr/bin/reposync --newest-only --repoid=rhel-server-rhscl-7-rpms -p /repos/html/Rhscl-7/ >> $LOG_FILE 2>&1
/usr/bin/reposync --newest-only --repoid=rhel-7-server-extras-rpms -p /repos/html/Extras/ >> $LOG_FILE 2>&1

# Update CreateRepo
/usr/bin/createrepo --update /repos/html/Redhat/rhel-7-server-rpms/Packages >> $LOG_FILE 2>&1
/usr/bin/createrepo --update /repos/html/Rhel7-optional/rhel-7-server-optional-rpms/Packages >> $LOG_FILE 2>&1
/usr/bin/createrepo --update /repos/html/HighAvailability/rhel-ha-for-rhel-7-server-rpms/Packages >> $LOG_FILE 2>&1
/usr/bin/createrepo --update /repos/html/ResilientStorage/rhel-rs-for-rhel-7-server-rpms/Packages >> $LOG_FILE 2>&1
/usr/bin/createrepo --update /repos/html/Rhscl-7/rhel-server-rhscl-7-rpms/Packages >> $LOG_FILE 2>&1
/usr/bin/createrepo --update /repos/html/Extras/rhel-7-server-extras-rpms/Packages  >> $LOG_FILE 2>&1

