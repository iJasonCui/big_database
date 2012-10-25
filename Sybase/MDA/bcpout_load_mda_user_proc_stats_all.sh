#!/bin/bash

. $HOME/.bash_profile

cd $SYBMAINT/MDA
TODAY_DATE=`date '+%Y%m%d'`

#------------------------------------------------------#
# house keeping 
# keep it in IQ for 30 days
#------------------------------------------------------#

if [ -f purge_mda_proc_stats.sh.log.${TODAY_DATE} ]
then
     echo 'The house keeping task has been runned...'
else
     echo 'File not found!'
     ./purge_mda_proc_stats.sh > purge_mda_proc_stats.sh.log.${TODAY_DATE}
fi

#------------------------------------------------------#
# load mda info into IQ
#------------------------------------------------------# 

#----------------------#
#  IVR
#----------------------#

for DB_SRV in v151dbp01ivr v151dbp03ivr v151db20 
do 
    ./bcpout_load_mda_user_proc_stats.sh ${DB_SRV} 
done

#----------------------#
#  WEB
#----------------------#
#webdb1g webdb0t webdb1d webdb0g

for DB_SRV in w151dbr01 w151dbp01 w151dbp02 w151dbp04 w151dbp03 w151dbp06 w151dbr02 w151dbr03 
do
    ./bcpout_load_mda_user_proc_stats.sh ${DB_SRV}
done

#----------------------#
#  Mobile
#----------------------#

for DB_SRV in m151devdb01sms  
do
    ./bcpout_load_mda_user_proc_stats.sh ${DB_SRV}
done

#----------------------#
#  CCD
#----------------------#

for DB_SRV in c151dbp02pgs c151dbp03pgs 
do
    ./bcpout_load_mda_user_proc_stats.sh ${DB_SRV}
done

## ivrdb1r 
## v151db20 
## v151dbp02mob 
## v151tstdb01 

exit 0

