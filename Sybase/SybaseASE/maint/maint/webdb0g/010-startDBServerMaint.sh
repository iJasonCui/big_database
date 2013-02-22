#!/bin/sh
if [ $# -ne 1 ] ; then
  echo "Usage: <serverName>"
  exit 1
else 
  serverName=${1}
fi

Password=`cat $HOME/.sybpwd | grep ${serverName} | awk '{print $2}'`

isql -Usa -S${serverName} -Dmaster -P ${Password} << EOQ
shutdown with nowait
go
EOQ

sleep 60

cd /opt/etc/sybase/install
./startserver -f ./RUN_${serverName}m
