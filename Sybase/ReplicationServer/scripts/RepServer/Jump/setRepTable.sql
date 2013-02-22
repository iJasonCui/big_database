select getdate()
go


--select "exec sp_setreptable " +  name + " , true"
--from sysobjects 
--where type = "U" and name not like "rs%"


exec sp_setreptable Process , true
exec sp_setreptable jump_user , true
exec sp_setreptable jumpout_user , true
exec sp_setreptable BATCHLOG , true
exec sp_setreptable PartnerAdcode , true
exec sp_setreptable Partner , true
exec sp_setreptable PartnerGroup , true
exec sp_setreptable PartnerSubLevelAdcode , true
exec sp_setreptable CookieId , true
exec sp_setreptable FlickOptIn , true
exec sp_setreptable LaSenzaPrizeCode , true
exec sp_setreptable RepTest , true
go

select getdate()
go


