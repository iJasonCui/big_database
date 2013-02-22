#!/bin/sh
if [ $# -ne 2 ] ; then
  echo "Usage: <serverName> <Environment> for instance, webdb1gm d"
  exit 1
else
  FileName=$0
  serverName=$1
  Environment=$2
fi

yyyymmddHHMMSS=`date '+%Y%m%d%H%M%S'`
logFile=output/${FileName}.log.${yyyymmddHHMMSS}.${serverName}.${Environment}

Password=`cat $HOME/.sybpwd | grep -w ${serverName} | awk '{print $2}'`

#-------------- grant permission ----------#

for dbName in "Profile_ad" "Profile_ar" "Profile_ai"
do

sqsh -Usa -S${serverName} -D${dbName} -P ${Password} -i grant-${dbName}.sql >> ${logFile}

echo "===================================" >> ${logFile}
echo "[dbName] "${dbName}          >> ${logFile} 

sqsh -Usa -S${serverName} -D${dbName} -P ${Password} <<EOQ1 >> ${logFile}

SELECT name FROM sysobjects WHERE type = "P" and name like "wsp%"
\do
\echo "GRANT EXECUTE ON #1 to web "
GRANT EXECUTE ON #1 to web
go
\done

SELECT name from sysobjects where type = "U" and name not like "rs%"
\do
\echo "GRANT SELECT ON #1 TO webmaint"
GRANT SELECT ON #1 TO webmaint
go
\done

EOQ1

done

echo "======= well done grant ================" >> ${logFile}

#-------------- only for dev; add webdbo as alias of dbo ------#

case ${Environment} in
"d")  

sqsh -Usa -S${serverName} -Dmaster -P ${Password} <<EOQ99 >> ${logFile}
SELECT name from sysdatabases where dbid >= 4 and dbid < 1000
\do
\echo "use #1; EXEC sp_addalias 'webdbo','dbo'"
use #1
go
EXEC sp_addalias 'webdbo','dbo'
go
dbcc settrunc('ltm', 'ignore')
go

USE master
go
EXEC sp_dboption #1,'abort tran on log full',true
go
USE master
go
EXEC sp_dboption #1,'trunc log on chkpt',true
go
USE #1
go
CHECKPOINT
go

\done

EOQ99
;;

"t")
sqsh -Usa -S${serverName} -Dmaster -P ${Password} <<EOQ99 >> ${logFile}
SELECT name from sysdatabases where dbid >= 4 and dbid < 1000
\do
\echo "use #1; dbcc settrunc('ltm', 'ignore')"
use #1
go
dbcc settrunc('ltm', 'ignore')
go
\done

EOQ99
;;

esac


#----------  update sysusers ---------#

for dbName in "Profile_ai"
do

sqsh -Usa -S${serverName} -Dmaster -P ${Password} <<EOQ4 >>${logFile} 

SELECT GETDATE()
go
PRINT 'Updating sysusers'
go
USE master
go
EXEC sp_configure 'allow updates to system tables',1
go

UPDATE ${dbName}..sysusers
SET suid = 4
WHERE name ='webmaint'
go
UPDATE ${dbName}..sysusers
SET suid = 3
WHERE name ='web'
go
UPDATE ${dbName}..sysusers
SET suid = 5
WHERE name ='webmaint'
go

USE master
go
EXEC sp_configure 'allow updates to system tables',0
go
SELECT GETDATE()
go

EOQ4

done

#-------update webrealm -----#
sqsh -Usa -S${serverName} -Dmaster -P ${Password} <<EOQ41 >>${logFile}

USE master
go
EXEC sp_configure 'allow updates to system tables',1
go

UPDATE Admin..sysusers
SET suid = 11
WHERE name ='webrealm'
go

USE master
go
EXEC sp_configure 'allow updates to system tables',0
go
SELECT GETDATE()
go

EOQ41

#------- the end of update sysusers ---------#

#-------- update UserSubscriptionAccount set autoRenew = "N" in order to disable the autoRenew ----#
dbName=Accounting

sqsh -Usa -S${serverName} -D${dbName} -P ${Password} <<EOQ5 >>${logFile}

SELECT GETDATE()
go
PRINT 'update UserSubscriptionAccount set autoRenew = "N" in order to disable the autoRenew'
go

use ${dbName} 
go

update UserSubscriptionAccount set autoRenew = "N"
go

SELECT GETDATE()
go

EOQ5

#------- the end of update UserSubscriptionAccount set autoRenew = "N" ----------#


#-------- update AdminUser set  password : WEBADMIN1;  encryptedPassword : clEZBRRebEodJEYaLzTv8Q== ----#
dbName=Admin

sqsh -Usa -S${serverName} -D${dbName} -P ${Password} <<EOQ6 >>${logFile}

SELECT GETDATE()
go
PRINT 'update AdminUser set encryptedPassword = "clEZBRRebEodJEYaLzTv8Q==" '
go

use ${dbName}
go

update AdminUser set encryptedPassword = "clEZBRRebEodJEYaLzTv8Q==", failedLoginCount = 0, passwordFlag = "A", activeStatusFlag = 1
go

SELECT GETDATE()
go

EOQ6

#------ the end of update AdminUser --------#

exit 0


