#!/bin/sh
ORACLE_HOME=/opt/app/oracle/product/12.1.0/dbhome_1
export ORACLE_HOME
export PATH=$ORACLE_HOME/bin:$PATH
ORACLE_SID=orcl; export ORACLE_SID
HOST='192.168.0.2'
USER='ftpuser'
PASSWD='password'
expdp scott/tiger DIRECTORY=backdir DUMPFILE=scott-$(date +%Y%m%d%H) VERSION=10.2 LOGFILE=scottLOG-$(date +%Y%m%d%H).log 
tar -cvzf /opt/app/oracle/admin/orcl/dpdump/scott-$(date +%Y%m%d%H).tar.gz home/app/oracle/admin/orcl/dpdump/scott-$(date +%Y%m%d%H).dmp
cat /opt/app/oracle/admin/orcl/dpdump/scottLOG-$(date +%Y%m%d%H).log | mutt -s "scott Backup" scott@tiger.com
cd /opt/app/oracle/admin/orcl/dpdump
ftp -n -v $HOST << EOT
binary
user $USER $PASSWD
prompt
put scott-$(date +%Y%m%d%H).tar.gz
bye
EOT
