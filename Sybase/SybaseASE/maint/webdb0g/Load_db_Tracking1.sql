PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Tracking1 FROM '/usr/l/data/dump/seed_db/Tracking1/Tracking1-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Tracking1
PRINT "========================" 
go
