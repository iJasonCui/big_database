PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Msg_mr FROM '/data/dump/Msg_mr/Msg_mr-dba-1'
STRIPE ON '/data/dump/Msg_mr/Msg_mr-dba-2'
STRIPE ON '/data/dump/Msg_mr/Msg_mr-dba-3'
STRIPE ON '/data/dump/Msg_mr/Msg_mr-dba-4'
STRIPE ON '/data/dump/Msg_mr/Msg_mr-dba-5'
STRIPE ON '/data/dump/Msg_mr/Msg_mr-dba-6'
STRIPE ON '/data/dump/Msg_mr/Msg_mr-dba-7'
STRIPE ON '/data/dump/Msg_mr/Msg_mr-dba-8'
go

SELECT GETDATE()
PRINT "========================" 
go
