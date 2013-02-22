PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE ContentJava FROM '/webdb0r_nfs/data/dump/webdb27p/ContentJava/ContentJava-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE ContentJava
PRINT "========================" 
go
