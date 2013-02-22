select getdate()
exec sp_setrepcol SavedSearch, searchArgument, replicate_if_changed 
select getdate()
go
select getdate()
exec sp_setrepcol m_romance, utext, replicate_if_changed 
select getdate()
go
select getdate()
exec sp_setrepcol m_backgreeting_romance, greeting, replicate_if_changed 
select getdate()
go
