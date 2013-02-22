select getdate()
exec sp_setrepcol  AdminActivityAd, adText, replicate_if_changed
go

select getdate()
exec sp_setrepcol  AdminActivityBSGreeting, BSGreetingText, replicate_if_changed
go

select getdate()
exec sp_setrepcol  advert, adtext, replicate_if_changed
go

select getdate()
exec sp_setrepcol  admin_notes, note, replicate_if_changed
go

