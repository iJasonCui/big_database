select getdate()
exec sp_setrepcol SystemMail, body, replicate_if_changed 
select getdate()
go
