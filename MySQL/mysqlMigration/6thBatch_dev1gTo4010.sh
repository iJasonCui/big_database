#!/bin/bash

RUN_DATE_TIME=`date '+%Y%m%d_%H%M%S'`
LOG_FILE=./logs/$0.log.${RUN_DATE_TIME}

date > ${LOG_FILE}

for DB_NAME in Member  
do

echo "#-----------------------" >> ${LOG_FILE}
echo "#  "${DB_NAME}  >> ${LOG_FILE}
echo "#-----------------------" >> ${LOG_FILE}
date >> ${LOG_FILE}
  
./dataMigrationSybMysql.sh  webdb1g  ${DB_NAME} 172.17.17.23 4010 ${DB_NAME}

done

echo "#-----------------------" >> ${LOG_FILE}
echo "#   completed " >> ${LOG_FILE}
echo "#-----------------------" >> ${LOG_FILE}
date >> ${LOG_FILE}

exit 0

