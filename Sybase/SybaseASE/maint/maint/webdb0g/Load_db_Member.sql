PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Member FROM '/webdb0r_nfs/data/dump/webdb27p/Member/Member-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Member/Member-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Member/Member-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Member/Member-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Member/Member-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Member/Member-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Member/Member-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Member/Member-dba-8'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Member/Member-dba-9'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Member/Member-dba-10'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Member
PRINT "========================" 
go
