EXEC sp_resetstatus archive
ALTER DATABASE archive SET EMERGENCY
DBCC checkdb(archive)
ALTER DATABASE archive SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DBCC CheckDB (archive, REPAIR_ALLOW_DATA_LOSS)
ALTER DATABASE archive SET MULTI_USER




/*
DBCC CHECKDB (archive) WITH NO_INFOMSGS, ALL_ERRORMSGS

EXEC sp_resetstatus archive; 

ALTER DATABASE archive SET EMERGENCY 

DBCC checkdb(archive) 

ALTER DATABASE archive SET SINGLE_USER WITH ROLLBACK IMMEDIATE 

DBCC CheckDB (archive, REPAIR_ALLOW_DATA_LOSS) 

ALTER DATABASE archive SET MULTI_USER
*/