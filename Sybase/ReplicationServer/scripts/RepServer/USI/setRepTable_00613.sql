select getdate()
exec sp_setreptable CRMCommPrefGroup, true
select getdate()
go
exec sp_setreptable CRMCommPreference, true
select getdate()
go 
exec sp_setreptable CRMUserPreference, true
select getdate()
go
exec sp_setreptable CRMMailSourceFamily, true
select getdate()
go

