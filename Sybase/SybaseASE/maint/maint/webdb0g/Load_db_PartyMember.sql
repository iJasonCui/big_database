PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE PartyMember FROM '/webdb0r_nfs/data/dump/webdb28p/PartyMember/PartyMember-dba-1'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/PartyMember/PartyMember-dba-2'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/PartyMember/PartyMember-dba-3'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/PartyMember/PartyMember-dba-4'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/PartyMember/PartyMember-dba-5'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/PartyMember/PartyMember-dba-6'
STRIPE ON '/webdb0r_nfs/data/dump/webdb28p/PartyMember/PartyMember-dba-7'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE PartyMember
PRINT "========================" 
go
