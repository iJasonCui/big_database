PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Msg_wi FROM '/webdb0r_nfs/data/dump/webdb22p/Msg_wi/Msg_wi-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wi/Msg_wi-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wi/Msg_wi-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wi/Msg_wi-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wi/Msg_wi-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wi/Msg_wi-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wi/Msg_wi-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wi/Msg_wi-dba-8'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Msg_wi
PRINT "========================" 
go
