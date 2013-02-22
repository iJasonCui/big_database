PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Msg_mr FROM '/webdb0r_nfs/data/dump/webdb22p/Msg_mr/Msg_mr-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_mr/Msg_mr-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_mr/Msg_mr-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_mr/Msg_mr-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_mr/Msg_mr-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_mr/Msg_mr-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_mr/Msg_mr-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_mr/Msg_mr-dba-8'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Msg_mr
PRINT "========================" 
go
