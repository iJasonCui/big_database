select getdate()
go


--select "exec sp_setreptable " +  name + " , true"
--from sysobjects 
--where type = "U" and name not like "rs%"

exec sp_setreptable AffiliateUser , true
go

select getdate()
go


