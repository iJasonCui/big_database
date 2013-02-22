select getdate()
exec sp_setrepcol w_dating, utext, replicate_if_changed 
select getdate()
go
select getdate()
exec sp_setrepcol w_backgreeting_dating, greeting, replicate_if_changed 
select getdate()
go
select getdate()
exec sp_setrepcol SavedSearch, searchArgument, replicate_if_changed 
select getdate()
go
