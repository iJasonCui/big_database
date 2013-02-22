PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE USI FROM '/webdb0r_nfs/data/dump/webdb28p/USI/USI-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/USI/USI-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/USI/USI-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/USI/USI-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/USI/USI-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/USI/USI-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/USI/USI-dba-7'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE USI
PRINT "========================" 
go
