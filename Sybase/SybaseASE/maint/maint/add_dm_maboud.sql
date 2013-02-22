USE master
go
EXEC sp_addlogin 'maboud','maboud_ps','master','us_english',"Mehrdad Aboudizadeh",null,6,null
go
EXEC sp_role 'grant','read_un_limited','maboud'
go
EXEC sp_modifylogin maboud, 'add default role', read_un_limited
go
IF SUSER_ID('maboud') IS NOT NULL
    PRINT '<<< CREATED LOGIN maboud >>>'
ELSE
    PRINT '<<< FAILED CREATING LOGIN maboud >>>'
go
USE Coupon
go
EXEC sp_adduser 'maboud','maboud','public'
go
USE Finance
go
EXEC sp_addalias 'maboud','dbo'
go
USE MI2
go
EXEC sp_addalias 'maboud','dbo'
go
USE MobileReporting
go
EXEC sp_addalias 'maboud','dbo'
go
USE NicheReporting
go
EXEC sp_addalias 'maboud','dbo'
go
USE PageCount
go
EXEC sp_addalias 'maboud','dbo'
go
USE SDReporting
go
EXEC sp_addalias 'maboud','dbo'
go
USE Tracking_new
go
EXEC sp_adduser 'maboud','maboud','public'
go
USE arch_Messages
go
EXEC sp_addalias 'maboud','dbo'
go
USE arch_Mobile
go
EXEC sp_addalias 'maboud','dbo'
go
USE arch_Profile
go
EXEC sp_addalias 'maboud','dbo'
go
USE arch_USI
go
EXEC sp_addalias 'maboud','dbo'
go
USE rpt_Profile
go
EXEC sp_addalias 'maboud','dbo'
go
USE wp_report
go
EXEC sp_addalias 'maboud','dbo'
go

