select getdate()
exec sp_setrepcol successstory, story, replicate_if_changed 
select getdate()
go
