select getdate()
go


--select "exec sp_setreptable " +  name + " , true"
--from sysobjects 
--where type = "U" and name not like "rs%"

exec sp_setreptable content_detail , true
exec sp_setreptable content_node , true
exec sp_setreptable content_text , true
exec sp_setreptable NodeType , true
exec sp_setreptable Page , true
exec sp_setreptable ValTest , true
exec sp_setreptable Node , true
exec sp_setreptable AttributeType , true
exec sp_setreptable Attribute , true
exec sp_setreptable ResourceProperty , true
exec sp_setreptable ResourcePropertyValue , true
exec sp_setreptable RepTest , true
exec sp_setreptable LongValue , true
exec sp_setreptable NodeTypeVal , true
exec sp_setreptable NodeNode , true
exec sp_setreptable NodePage , true
exec sp_setreptable ResourcePropertyPage , true
exec sp_setreptable NodeTypeAttributeType , true
exec sp_setreptable NodeId , true
exec sp_setreptable NodeTypeId , true
exec sp_setreptable AttributeId , true
exec sp_setreptable LongValueId , true
exec sp_setreptable AttributeTypeId , true
exec sp_setreptable PageId , true
exec sp_setreptable PropertyId , true
exec sp_setreptable PropertyValueId , true
exec sp_setreptable AttributeLongValueId , true
exec sp_setreptable content_node_fr_CA , true
exec sp_setreptable content_text_fr_CA , true


select getdate()
go


