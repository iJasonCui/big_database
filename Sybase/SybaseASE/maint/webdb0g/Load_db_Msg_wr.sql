PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Msg_wr FROM '/webdb0r_nfs/data/dump/webdb22p/Msg_wr/Msg_wr-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wr/Msg_wr-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wr/Msg_wr-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wr/Msg_wr-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wr/Msg_wr-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wr/Msg_wr-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wr/Msg_wr-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wr/Msg_wr-dba-8'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Msg_wr
PRINT "========================" 
go
