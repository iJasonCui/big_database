PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Jump FROM '/usr/l/data/dump/seed_db/Jump/Jump-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Jump
PRINT "========================" 
go
