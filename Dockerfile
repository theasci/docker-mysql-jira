FROM theasci/docker-mysql

ADD setup_and_run_mysql_jira.sh /usr/local/bin/setup_and_run_mysql_jira.sh
CMD /usr/local/bin/setup_and_run_mysql_jira.sh
