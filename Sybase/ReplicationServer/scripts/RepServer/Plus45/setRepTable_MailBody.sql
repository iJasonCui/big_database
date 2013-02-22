sp_configure 'system tables',1
go
exec sp_setreptable_text MailBody, 'true','owner_off', 'replicate_if_changed'
go
sp_configure 'system tables',0
go
