PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Profile_wi FROM '/webdb0r_nfs/data/dump/webdb22p/Profile_wi/Profile_wi-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_wi/Profile_wi-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_wi/Profile_wi-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_wi/Profile_wi-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_wi/Profile_wi-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_wi/Profile_wi-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_wi/Profile_wi-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb22p/Profile_wi/Profile_wi-dba-8'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Profile_wi
PRINT "========================" 
go
