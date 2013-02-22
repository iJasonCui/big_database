PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Profile_mi FROM '/webdb0r_nfs/data/dump/webdb22p/Profile_mi/Profile_mi-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_mi/Profile_mi-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_mi/Profile_mi-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_mi/Profile_mi-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_mi/Profile_mi-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_mi/Profile_mi-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_mi/Profile_mi-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_mi/Profile_mi-dba-8'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Profile_mi
PRINT "========================" 
go
