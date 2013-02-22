PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Chargeback FROM '/webdb0r_nfs/data/dump/webdb27p/Chargeback/Chargeback-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Chargeback
PRINT "========================" 
go
