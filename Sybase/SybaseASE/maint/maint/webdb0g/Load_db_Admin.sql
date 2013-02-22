PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Admin FROM '/webdb0r_nfs/data/dump/webdb27p/Admin/Admin-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Admin/Admin-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Admin/Admin-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Admin/Admin-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Admin/Admin-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Admin/Admin-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Admin/Admin-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Admin/Admin-dba-8'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Admin/Admin-dba-9'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Admin/Admin-dba-10'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Admin
PRINT "========================" 
go
