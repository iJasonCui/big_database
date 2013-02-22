PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Profile_md FROM '/webdb0r_nfs/data/dump/webdb22p/Profile_md/Profile_md-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_md/Profile_md-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_md/Profile_md-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_md/Profile_md-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_md/Profile_md-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_md/Profile_md-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_md/Profile_md-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_md/Profile_md-dba-8'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Profile_md
PRINT "========================" 
go
