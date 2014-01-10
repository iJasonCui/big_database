select name,def_remote_loc 
from sysdatabases
where def_remote_type = 1

sp_helpexternlogin

select name, * from syslogins

exec sp_addexternlogin  g151dbr07,	iwong,	webmaint, free2stay
--sp_addexternlogin  g151dbr07,	aalb,	webmaint
exec sp_addexternlogin  g151dbr07,	amcnam,	webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	aradu,	webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	bi	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	bvo	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	ccd_cron	,webmaint, free2stay
--exec sp_addexternlogin  g151dbr07,	cis_user	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	cron_ccd	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	cron_dm	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	cron_sa	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	cube	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	dmteam	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	finance	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	finance900	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	financeSun	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	hqian	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	ibang	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	jcui	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	read_only_user	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	remotefrom0r	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	reports	,webmaint, free2stay
--exec sp_dropexternlogin  g151dbr07,	syi	
--exec sp_addexternlogin  g151dbr07,	syi	,webmaint, free2stay, free2stay
exec sp_addexternlogin  g151dbr07,	testuser	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	tkchan	,webmaint, free2stay
exec sp_addexternlogin  g151dbr07,	web	,webmaint, free2stay


create database Accounting1g4100 on [db_device_name] = [size]
  with default_location='webdb1g.Accounting.dbo.'
  for proxy_update


drop database ContentMonitor

connect to g151dbr07

USE master
go
CREATE DATABASE ContentMonitor ON DB_LOG_log1=200
  with default_location='g151dbr07.ContentMonitor.dbo.'
  for proxy_update

go

