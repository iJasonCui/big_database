select getdate()
go


--select "exec sp_setreptable " +  name + " , true"
--from sysobjects 
--where type = "U" and name not like "rs%"


exec sp_setreptable Process , true
exec sp_setreptable content_category , true
exec sp_setreptable content_detail , true
exec sp_setreptable content_image , true
exec sp_setreptable content_node , true
exec sp_setreptable content_service , true
exec sp_setreptable content_subservice , true
exec sp_setreptable content_text , true
exec sp_setreptable content_text_wp , true
exec sp_setreptable Banner , true
exec sp_setreptable AdCodeType , true
exec sp_setreptable BannerEligibility , true
exec sp_setreptable CreditDistribution , true
exec sp_setreptable BannerGroup , true
exec sp_setreptable RepTest , true


select getdate()
go


