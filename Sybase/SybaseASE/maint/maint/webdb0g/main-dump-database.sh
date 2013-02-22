#!/bin/bash

#***************************************#
# dump-database.sh
# Author: Jason C.
# Date: Oct 18 2004
# Function: Dump database
# 
#***************************************#

if [ $# -ne 3 ] ; then
  echo "Usage: <ServerName> <Database Name> <Database Identifier> "
  exit 1
fi

#--------------------------------#
# Initialize arguments
#--------------------------------#

ServerName=$1
DatabaseName=$2
DatabaseIdentifier=$3


#JobId=`cat DumpDatabaseSchedule.ini | grep -w ${DatabaseName} | awk '{print $2}'`
#ScheduleId=`cat DumpDatabaseSchedule.ini | grep -w ${DatabaseName} | awk '{print $3}'`

sourcePath=`cat DBDumpConfig.ini | grep -w ${DatabaseName} | awk '{print $2}'`
StripesCount=`cat DBDumpConfig.ini | grep -w ${DatabaseName} | awk '{print $3}'`

. /opt/etc/sybase/.bash_profile

LogFile=$SYBMAINT/Refresh/logs/$DatabaseName/$0.log
BackupServerStatus=$SYBMAINT/Refresh/logs/$DatabaseName/BackupServerStatus
Password=`cat $HOME/.sybpwd | grep -w ${ServerName} | awk '{print $2}'`
SQLDumpdb=$SYBMAINT/Refresh/Dump_db_$DatabaseName.sql
MSG_LOG=$SYBMAINT/Refresh/logs/$DatabaseName/dump-database.${DatabaseName}.mail


#--------------------------------------------#
#   Function ErrorHandler                    #
#--------------------------------------------#
function ErrorHandler
{
echo "######################"
echo " EXECUTING FUNCTION   "
echo "${JobId},${ScheduleId},${executionNote},${executionStatus},${jobSpecificCode},${logLocation}"
echo "######################"

ssh backmon@opsdb1p "/home/backmon/executionInsert.sh ${JobId} ${ScheduleId} '${executionNote}' ${executionStatus} ${jobSpecificCode} ${LogFile}"
}

#--------------------------------------------#
#   Function GenerateSQL()                   #
#--------------------------------------------#
GenerateSQL() 
{
  echo "PRINT \"========================\" " >  ${SQLDumpdb}
  echo "SELECT GETDATE()"                    >> ${SQLDumpdb}
  echo ""                                    >> ${SQLDumpdb}
  echo "DUMP DATABASE "${DatabaseName}" to '"${sourcePath}"/"${DatabaseName}"/"${DatabaseName}"-db"${DatabaseIdentifier}"-1'" >> ${SQLDumpdb}

  StripeIndex=1
  while [ "${StripeIndex}" -ne "${StripesCount}" ]  
  do
    let "StripeIndex+=1"   
    echo "STRIPE ON '"${sourcePath}"/"${DatabaseName}"/"${DatabaseName}"-db"${DatabaseIdentifier}"-"${StripeIndex}"'" >>${SQLDumpdb}
  done
	
  echo "go"                                  >> ${SQLDumpdb}
  echo ""                                    >> ${SQLDumpdb}
  echo "SELECT GETDATE()"                    >> ${SQLDumpdb}
  echo "PRINT \"========================\" " >> ${SQLDumpdb}
  echo "go"                                  >> ${SQLDumpdb}

 
}

echo "Dump Database "${DatabaseName} > ${LogFile}

date > ${BackupServerStatus}

isql -S${ServerName} -Usa -P${Password} << EOF2 >> ${BackupServerStatus} 
SYB_BACKUP...sp_who
go
EOF2

date >> ${BackupServerStatus}

egrep -e "Msg 42|error" ${BackupServerStatus}  > ${BackupServerStatus}.err 

if [ -s "${BackupServerStatus}.err" ]
then
    mailx -s "Could not connect to Backup server when Dump "${DSQUERY}.${DatabaseName} ${SYBMAILTO} < ${BackupServerStatus}.err 
    sleep 60
fi

#-----------------------------------------------#
# generate the sql statement to Dump database
#-----------------------------------------------#
GenerateSQL 

isql -S${ServerName} -Usa -P${Password} -i ${SQLDumpdb} >> ${LogFile}

egrep -e "Msg 42|error" ${LogFile}  > ${LogFile}.tmp

if [ -s "${LogFile}.tmp" ]     ## error log is not empty, it means something wrong
then
   printf "Full Backup Failed at ${ServerName}.${DatabaseName},\nPlease Check.\n"> ${MSG_LOG}
   egrep -e "Msg 42|error" ${LogFile} >> ${MSG_LOG}
   mailx -s "Full Backup Failed at "${ServerName}.${DatabaseName} ${SYBMAILTO} < ${MSG_LOG}
   executionStatus="2"
   jobSpecificCode="1" 
   executionNote=$0" failed at "${ServerName}.${DatabaseName}";Please call DBM; LogFile: "${LogFile}    
#   ErrorHandler    ## invoke teh function  
else
   executionStatus="1"
   jobSpecificCode="1"
   executionNote=$0" has been done successfully at "${ServerName}.${DatabaseName}
#   ErrorHandler    ## invoke teh function 
fi

exit 0 

