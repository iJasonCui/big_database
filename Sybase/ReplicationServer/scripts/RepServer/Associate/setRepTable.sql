select getdate()
go


--select "exec sp_setreptable " +  name + " , true"
--from sysobjects 
--where type = "U" and name not like "rs%"


exec sp_setreptable AssociateAdCode , true
exec sp_setreptable AssociateCookie , true
exec sp_setreptable SiteType , true
exec sp_setreptable Associate , true
exec sp_setreptable AssociateCheque , true
exec sp_setreptable AssociateContact , true
exec sp_setreptable AssociateId , true
exec sp_setreptable AssociateNote , true
exec sp_setreptable AssociateSite , true
exec sp_setreptable AssociateTrans , true
exec sp_setreptable Status , true
exec sp_setreptable RepTest , true

select getdate()
go


