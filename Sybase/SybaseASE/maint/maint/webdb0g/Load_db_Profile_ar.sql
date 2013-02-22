PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Profile_ar FROM '/webdb0r_nfs/data/dump/webdb23p/Profile_ar/Profile_ar-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ar/Profile_ar-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ar/Profile_ar-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ar/Profile_ar-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ar/Profile_ar-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ar/Profile_ar-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ar/Profile_ar-dba-7'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Profile_ar
PRINT "========================" 
go
