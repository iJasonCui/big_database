PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Tracking FROM '/usr/l/data/dump/seed_db/Tracking/Tracking-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Tracking
PRINT "========================" 
go
