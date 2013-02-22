PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE Accounting FROM '/webdb0r_nfs/data/dump/webdb27p/Accounting/Accounting-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Accounting/Accounting-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Accounting/Accounting-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Accounting/Accounting-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Accounting/Accounting-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Accounting/Accounting-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Accounting/Accounting-dba-7'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Accounting/Accounting-dba-8'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Accounting/Accounting-dba-9'
STRIPE ON '/webdb0r_nfs/data/dump/webdb27p/Accounting/Accounting-dba-10'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE Accounting
PRINT "========================" 
go
