
--select "exec sp_setreptable " +  name + " , true"
--from sysobjects 
--where type = "U" and name not like "rs%"

select getdate()
exec sp_setreptable Comment , true
go
select getdate()
go

exec sp_setrepcol Comment , comment, replicate_if_changed
go

select getdate()
go

