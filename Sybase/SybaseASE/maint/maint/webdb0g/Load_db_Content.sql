PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Content FROM '/webdb0r_nfs/data/dump/webdb27p/Content/Content-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Content
PRINT "========================" 
go
