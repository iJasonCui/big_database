PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Msg_ar FROM '/webdb0r_nfs/data/dump/webdb22p/Msg_ar/Msg_ar-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ar/Msg_ar-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ar/Msg_ar-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ar/Msg_ar-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ar/Msg_ar-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ar/Msg_ar-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ar/Msg_ar-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ar/Msg_ar-dba-8'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Msg_ar
PRINT "========================" 
go
