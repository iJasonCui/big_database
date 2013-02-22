PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Tracking2 FROM '/usr/l/data/dump/seed_db/Tracking2/Tracking2-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Tracking2
PRINT "========================" 
go
