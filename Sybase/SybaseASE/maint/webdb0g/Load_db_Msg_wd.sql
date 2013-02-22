PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Msg_wd FROM '/webdb0r_nfs/data/dump/webdb22p/Msg_wd/Msg_wd-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wd/Msg_wd-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wd/Msg_wd-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wd/Msg_wd-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wd/Msg_wd-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wd/Msg_wd-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wd/Msg_wd-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_wd/Msg_wd-dba-8'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Msg_wd
PRINT "========================" 
go
