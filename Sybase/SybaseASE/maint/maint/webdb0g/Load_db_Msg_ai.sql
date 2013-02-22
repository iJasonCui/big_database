PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Msg_ai FROM '/webdb0r_nfs/data/dump/webdb22p/Msg_ai/Msg_ai-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ai/Msg_ai-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ai/Msg_ai-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ai/Msg_ai-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ai/Msg_ai-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ai/Msg_ai-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ai/Msg_ai-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Msg_ai/Msg_ai-dba-8'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Msg_ai
PRINT "========================" 
go
