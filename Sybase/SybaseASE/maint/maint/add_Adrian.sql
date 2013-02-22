USE master
go
EXEC sp_addlogin 'aalb','aalb_ps','master','us_english',"Adrian Alb",null,null,null
go
EXEC sp_role 'grant','sa_role','aalb'
go
EXEC sp_role 'grant','oper_role','aalb'
go
EXEC sp_role 'grant','sybase_ts_role','aalb'
go
IF SUSER_ID('aalb') IS NOT NULL
    PRINT '<<< CREATED LOGIN aalb >>>'
ELSE
    PRINT '<<< FAILED CREATING LOGIN aalb >>>'
go

