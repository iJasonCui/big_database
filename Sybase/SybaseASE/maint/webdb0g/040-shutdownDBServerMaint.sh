#!/bin/sh
if [ $# -ne 1 ] ; then
  echo "Usage: <serverName> for instance, webdb1g instaed of webdb1gm"
  exit 1
fi

serverName=$1

Password=`cat $HOME/.sybpwd | grep ${serverName}m | awk '{print $2}'`

isql -Usa -S${serverName}m -Dmaster -P ${Password} << EOQ
shutdown
go
EOQ

sleep 60

cd /opt/etc/sybase/install
./startserver -f ./RUN_${serverName}
