USE master
go
EXEC sp_addlogin 'cmessa','cmessa_ps','master','us_english',"Courtney Messam",null,null,null
go
EXEC sp_role 'grant','sa_role','cmessa'
go
EXEC sp_role 'grant','oper_role','cmessa'
go
EXEC sp_role 'grant','sybase_ts_role','cmessa'
go
IF SUSER_ID('cmessa') IS NOT NULL
    PRINT '<<< CREATED LOGIN cmessa >>>'
ELSE
    PRINT '<<< FAILED CREATING LOGIN cmessa >>>'
go

