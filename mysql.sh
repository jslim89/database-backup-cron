#!/bin/bash

#### CONFIG ####

# don't include the trailing slash
backup_dir=/home/user/backup_dir

# maximum number of files to keep
max_backup_files=5

# prefix of the filename, e.g. foo_db-2016-01-15_23-59-59.sql
filename_prefix="foo_db"

# database config
db_name="foo_staging"
db_user="root"
db_pass="secret"

#### SCRIPT ####
if [ ! -d $backup_dir ]; then
    mkdir $backup_dir
fi

# change this line if you use postgresql
mysqldump $db_name -u $db_user -p$db_pass > $backup_dir/$filename_prefix-`date +"%Y-%m-%d_%H-%M-%S.sql"`

total_sql=`ls -l $backup_dir/*.sql | wc -l`

if [ $total_sql -gt $max_backup_files ]; then
    old_file=`ls $backup_dir/*.sql | sort | head -n 1`
    echo "Exceed $max_backup_files files, remove $old_file"
    rm -f $old_file
fi
