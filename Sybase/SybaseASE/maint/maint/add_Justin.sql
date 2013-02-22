USE master
go
EXEC sp_addlogin 'jniu','jniu_ps','master','us_english',"Justin Niu",null,null,null
go
EXEC sp_role 'grant','sa_role','jniu'
go
EXEC sp_role 'grant','oper_role','jniu'
go
EXEC sp_role 'grant','sybase_ts_role','jniu'
go
IF SUSER_ID('jniu') IS NOT NULL
    PRINT '<<< CREATED LOGIN jniu >>>'
ELSE
    PRINT '<<< FAILED CREATING LOGIN jniu >>>'
go

