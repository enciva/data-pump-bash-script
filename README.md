# data-pump-bash-script

Basic bash script to backup schema and send to remote location

Export the Scott schema on a daily basis using Data Pump.

Create a log file of the Data Pump export

Add the date and hour of the export to to the file name and log file in the forms of : scott-yyyymmddhh.dmp. and scottLOG-yyyymmddhh.log

Use zip or gzip to compress the dump file for easier FTP and/or mailing

Write the contents of the log file into the body of an email.

FTP the file or attach the file to the email and send it.

You will first need to create backup directory and grant read, write to schema:

SQL> CREATE OR REPLACE DIRECTORY backdir AS /opt/app/oracle/admin/orcl/dpdump  
  
SQL> GRANT READ, WRITE ON DIRECTORY backdir TO scott; 
