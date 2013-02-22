PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE SuccessStory FROM '/usr/l/data/dump/seed_db/SuccessStory/SuccessStory-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE SuccessStory
PRINT "========================" 
go
