#!/bin/bash

. $HOME/.bash_profile

#if [ $# -ne 6 ] ; then
#  echo "Usage: <JobId> <scheduleId> <executionNote> <executionStatus> <jobSpecificCode> <logLocation >"
#  exit 1
#fi

#
# Initialize arguments
#

DatabaseName=MonitorBackupP
Server=opsdb1p

Password=`cat $HOME/.sybpwd | grep -w $Server | awk '{print $2}'`
isql -S${Server} -Ucron_sa -P${Password} <<EOF1
select getdate()
go

use ${DatabaseName}
go

exec  bsp_AddAlerts

go
select getdate()
go

EOF1

exit 0
~
~
~
