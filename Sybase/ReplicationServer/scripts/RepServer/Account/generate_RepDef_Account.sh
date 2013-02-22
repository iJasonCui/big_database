#!/bin/bash

if [ $# -ne 1 ] ; then
  echo "Usage: <REP_SRV> "
  exit 1
fi

REP_SRV=${1}

ProcessedDateTime=`date '+%Y%m%d_%H%M%S'`
USER_NAME=sa
PASSWORD=`cat $HOME/.sybpwd | grep -w ${REP_SRV} | awk '{print $2}'`

#-------------------------------------#
# Function 
# 
#-------------------------------------#

CREATE_REP_DEF ()
{

sqsh -U${USER_NAME} -P${PASSWORD} -S${REP_SRV}  << EOQ1 >> ${LOG_FILE} 

create replication definition "${DB_NAME}_Account"
with primary at LogicalSRV.${DB_NAME}
with all tables named "Account"
(
    "region" int,               
    "accountnum" int,               
    "accountId"  int,                
    "status" int,               
    "type" int,                 
    "passcode" int,             
    "balance" int,               
    "date_created"  datetime,                
    "date_lastaccess"  datetime,   
    "date_expire"      datetime,
    "date_birth"       datetime,          
    "onlineFlag" int, 
    "onlineStatus" int,
    "partnershipId" int,             
    "dnis" char(25),
    "freeBalance"         int,
    "msgReceivedCount"    int,
    "current_dnis"        char(25),
    "date_current_dnis"   datetime ,
    "pos_saleflag"        int      ,
    "pos_date_lastaccess" datetime ,
    "rsrflag"             int      ,
    "ani"     char(25) ,
    "adDnis"              char(25)
)
primary key ("region","accountnum","accountId")
replicate minimal columns
/* No searchable columns */
/* No minimal columns */

go

EOQ1

}

while read SRV_INFO
do 
     echo $SRV_INFO > ${0}.ini
     DB_NAME=` cat ${0}.ini | awk '{print $1}' `

     echo "===================================================="
     echo ${DB_NAME} 
     echo "----------------------------------------------------"

     LOG_FILE=./output/${0}.out.${ProcessedDateTime}.${DB_NAME}.${REP_SRV}
  
     echo "====================================================" > ${LOG_FILE}
     echo ${DB_NAME}  >> ${LOG_FILE}
     echo "----------------------------------------------------" >> ${LOG_FILE}
 
     #-----------------------------------#
     # Function Call 
     #-----------------------------------#
     CREATE_REP_DEF
 
done < Account_rep_def.ini 


exit 0

