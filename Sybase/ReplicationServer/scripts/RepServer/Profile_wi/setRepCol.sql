select getdate()
exec sp_setrepcol w_intimate, utext, replicate_if_changed 
select getdate()
go
select getdate()
exec sp_setrepcol w_backgreeting_intimate, greeting, replicate_if_changed 
select getdate()
go
select getdate()
exec sp_setrepcol SavedSearch, searchArgument, replicate_if_changed 
select getdate()
go
