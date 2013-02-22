USE master
go
EXEC sp_addlogin 'ibang','ibang_ps','master','us_english',"In Kap Bang",null,null,null
go
EXEC sp_role 'grant','sa_role','ibang'
go
EXEC sp_role 'grant','oper_role','ibang'
go
EXEC sp_role 'grant','sybase_ts_role','ibang'
go
IF SUSER_ID('ibang') IS NOT NULL
    PRINT '<<< CREATED LOGIN ibang >>>'
ELSE
    PRINT '<<< FAILED CREATING LOGIN ibang >>>'
go

