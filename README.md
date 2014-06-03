docker-mysql-jira
============

Standalone MySQL image for using with Jira. Example usage:

    docker run -p 3306:3306 -e 'MYSQL_USER=jira' -e 'MYSQL_PASSWORD=*A1E4DA33BE7AF0265EDD4B009781E2FA02E220CF' -d theasci/docker-mysql-jira

Environment variables
---------------------

 - `MYSQL_USER`: User Jira connects as. Defaults to `"jira"`
 - `MYSQL_DATABASE`: Database used by Jira. Defaults to `"jira"`
 - `MYSQL_PASSWORD`: Hash of the password for the jira user. Defaults to `"*A1E4DA33BE7AF0265EDD4B009781E2FA02E220CF"` ("jira")
 - `MYSQLD_ARGS`: Extra parameters to pass to the mysqld process. Defaults to `"--skip-name-resolve --skip-host-cache"`
