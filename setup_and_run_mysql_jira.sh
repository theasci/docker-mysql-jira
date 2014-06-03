#!/bin/bash
set -eu

MYSQLD_ARGS=${MYSQLD_ARGS:-"--skip-name-resolve --skip-host-cache"}
MYSQL_USER=${MYSQL_USER:-"jira"}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-"*A1E4DA33BE7AF0265EDD4B009781E2FA02E220CF"}
MYSQL_DB=${MYSQL_DB:-"jira"}

tfile=`mktemp`
if [[ ! -f "$tfile" ]]; then
    return 1
fi

cat << EOF > $tfile
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $MYSQL_DB CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%' IDENTIFIED BY PASSWORD '$MYSQL_PASSWORD';
EOF

/usr/sbin/mysqld --bootstrap --verbose=0 $MYSQLD_ARGS < $tfile
rm -f $tfile

exec /usr/sbin/mysqld $MYSQLD_ARGS
