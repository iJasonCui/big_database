#!/bin/sh

nohup ./010-startDBServerMaint.sh webdb0t

sleep 300

nohup ./020-load-all-db.sh webdb0tm 

nohup ./030-postLoad.sh webdb0tm t

nohup ./040-shutdownDBServerMaint.sh webdb0t 

exit 0

