PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Profile_ad FROM '/webdb0r_nfs/data/dump/webdb23p/Profile_ad/Profile_ad-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ad/Profile_ad-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ad/Profile_ad-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ad/Profile_ad-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ad/Profile_ad-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ad/Profile_ad-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb23p/Profile_ad/Profile_ad-dba-7'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Profile_ad
PRINT "========================" 
go
