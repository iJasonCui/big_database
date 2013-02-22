PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Associate FROM '/webdb0r_nfs/data/dump/webdb27p/Associate/Associate-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Associate
PRINT "========================" 
go
