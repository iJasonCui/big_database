
--select "exec sp_setreptable " +  name + " , true"
--from sysobjects 
--where type = "U" and name not like "rs%"

select getdate()

exec sp_setreptable Publication , true
exec sp_setreptable PublicationAudience , true
exec sp_setreptable PublicationAuxiliary , true
exec sp_setreptable PublicationNextId , true
exec sp_setreptable PublicationOperator , true
exec sp_setreptable PublicationSection , true
exec sp_setreptable Vote, true

select getdate()
go

exec sp_setrepcol PublicationSection, body, replicate_if_changed
go

select getdate()
go


