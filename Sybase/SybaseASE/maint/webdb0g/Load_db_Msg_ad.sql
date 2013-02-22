PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Msg_ad FROM '/webdb0r_nfs/data/dump/webdb22p/Msg_ad/Msg_ad-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ad/Msg_ad-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ad/Msg_ad-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ad/Msg_ad-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ad/Msg_ad-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ad/Msg_ad-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ad/Msg_ad-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ad/Msg_ad-dba-8'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Msg_ad
PRINT "========================" 
go
