PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE IVRPictures FROM '/webdb0r_nfs/data/dump/webdb27p/IVRPictures/IVRPictures-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE IVRPictures
PRINT "========================" 
go
