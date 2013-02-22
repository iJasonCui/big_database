PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Profile_ai FROM '/webdb0r_nfs/data/dump/webdb25p/Profile_ai/Profile_ai-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb25p/Profile_ai/Profile_ai-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb25p/Profile_ai/Profile_ai-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb25p/Profile_ai/Profile_ai-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb25p/Profile_ai/Profile_ai-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb25p/Profile_ai/Profile_ai-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb25p/Profile_ai/Profile_ai-dba-7'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Profile_ai
PRINT "========================" 
go
