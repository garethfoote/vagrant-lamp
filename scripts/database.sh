#!/bin/bash

# Directory vars
CWD="/vagrant"

# Set all .env vars
set -a
. $CWD/.env
set +a

echo "-- Setup databases ${DB_NAME} --"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -uroot -proot -e "DROP DATABASE IF EXISTS ${DB_NAME}";
mysql -uroot -proot -e "CREATE DATABASE ${DB_NAME}";

# If db dump exists
if [ ! -z "$DB_SQL_DUMP" ] && [ -e "$CWD/$DB_SQL_DUMP" ]; then
  # If domain replacement required
  if [ -z ${DB_REPLACEDOMAIN+x} ]; then
    echo "-- Import SQL --"
    mysql -uroot -proot $DB_NAME < $CWD/$DB_SQL_DUMP
  else
    echo "-- Search/Replace SQL - ${DB_REPLACEDOMAIN} with ${HOSTNAME} --"
    sed "s/${DB_REPLACEDOMAIN}/${HOSTNAME}/g" $CWD/$DB_SQL_DUMP > $CWD/tmp.sql
    echo "-- Import SQL --"
    mysql -uroot -proot $DB_NAME < $CWD/tmp.sql
    rm -f $CWD/tmp.sql
  fi
fi
