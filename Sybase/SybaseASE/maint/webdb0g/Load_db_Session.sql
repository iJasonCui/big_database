PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Session FROM '/usr/l/data/dump/seed_db/Session/Session-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Session
PRINT "========================" 
go
