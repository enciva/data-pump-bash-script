# data-pump-bash-script

Basic bash scripts to backup a schema using Oracle Data Pump and send to remote location.

1. Export the Scott schema on a daily basis using Data Pump.

2. Create a log file of the Data Pump export

3. Add the date and hour of the export to to the file name and log file in the forms of : scott-yyyymmddhh.dmp. and scottLOG-yyyymmddhh.log

4. Use zip, tar or gzip to compress the dump file for easier FTP and/or mailing

5. Write the contents of the log file into the body of an email.

6. FTP the file or attach the file to the email and send it.

You will first need to create backup directory and grant read, write to schema:

SQL> CREATE OR REPLACE DIRECTORY backdir AS /opt/app/oracle/admin/orcl/dpdump  
  
SQL> GRANT READ, WRITE ON DIRECTORY backdir TO scott; 
