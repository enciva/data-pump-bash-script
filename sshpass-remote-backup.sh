#!/bin/bash
#Enciva SFTP SSH PASS
#Note: to specifiy port, use below:
# cat >> /root/.ssh/config
# hostname
#  Port 2727
#  StrictHostKeyChecking no

ORACLE_HOME=/opt/app/oracle/product/12.1.0/dbhome_1
export ORACLE_HOME
export PATH=$ORACLE_HOME/bin:$PATH
ORACLE_SID=orc; export ORACLE_SID
export PATH="${ORACLE_HOME}/bin:${PATH}"

HOST='sftphost.com'
USER='sftpusername'
PASSWD='sftppassword'

TSTAMP="$(date +%Y%m%d)"

expdp USERNAME/PASSWORD DIRECTORY=backupdirectory DUMPFILE=USERNAME-$(date +%Y%m%d) LOGFILE=USERNAMElog-$(date +%Y%m%d).log
tar -cvzf /opt/app/oracle/admin/orc/dpdump/USERNAME-$(date +%Y%m%d).tar.gz /opt/app/oracle/admin/orc/dpdump/USERNAME-$(date +%Y%m%d).dmp
cd /opt/app/oracle/admin/orc/dpdump

sshpass -p "${PASSWD}" sftp -v ${USER}@${HOST} << EOT
cd /path/to/backups
put USERNAME-${TSTAMP}.tar.gz
bye
EOT
