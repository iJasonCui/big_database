PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE SMSGateway FROM '/webdb0r_nfs/data/dump/webdb27p/SMSGateway/SMSGateway-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE SMSGateway
PRINT "========================" 
go
