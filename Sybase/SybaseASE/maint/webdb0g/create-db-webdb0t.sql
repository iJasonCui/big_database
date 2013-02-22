USE master
go
CREATE DATABASE Accounting
    ON wdev1=2048,   
    wdev2=2048,   
    wdev3=2048
    LOG ON wdev4=2048
go
ALTER DATABASE Accounting 
    ON wdev21=2048
go
ALTER DATABASE Accounting 
    ON wdev24=2048
go
ALTER DATABASE Accounting 
    ON wdev29=512
go
USE master
go
EXEC sp_dboption 'Accounting','abort tran on log full',true
go
EXEC sp_dboption 'Accounting','trunc log on chkpt',true
go
USE Accounting
go
CHECKPOINT
go
USE Accounting
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Accounting') IS NOT NULL
    PRINT '<<< CREATED DATABASE Accounting >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Accounting >>>'
go

USE master
go
CREATE DATABASE Admin
    ON wdev5=2048,   
    wdev6=2048
    LOG ON wdev7=1024
go
ALTER DATABASE Admin 
    ON wdev8=2048
go
ALTER DATABASE Admin 
    ON wdev25=2048
go
ALTER DATABASE Admin 
    ON wdev29=512
go
ALTER DATABASE Admin 
    ON wdev18=318
go
ALTER DATABASE Admin 
    ON wdev17=64
go
ALTER DATABASE Admin 
    ON wdev17=94
go
ALTER DATABASE Admin 
    ON wdev1019=36
go
USE master
go
EXEC sp_dboption 'Admin','abort tran on log full',true
go
EXEC sp_dboption 'Admin','trunc log on chkpt',true
go
USE Admin
go
CHECKPOINT
go
USE Admin
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Admin') IS NOT NULL
    PRINT '<<< CREATED DATABASE Admin >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Admin >>>'
go

USE master
go
CREATE DATABASE Associate
    ON wdev11=512
    LOG ON wdev14=256
go
ALTER DATABASE Associate 
    ON wdev1019=512
go
USE master
go
EXEC sp_dboption 'Associate','abort tran on log full',true
go
EXEC sp_dboption 'Associate','trunc log on chkpt',true
go
USE Associate
go
CHECKPOINT
go
USE Associate
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Associate') IS NOT NULL
    PRINT '<<< CREATED DATABASE Associate >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Associate >>>'
go

USE master
go
CREATE DATABASE Chargeback
    ON wdev16=384
    LOG ON wdev14=128
go
USE Chargeback
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Chargeback') IS NOT NULL
    PRINT '<<< CREATED DATABASE Chargeback >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Chargeback >>>'
go

USE master
go
CREATE DATABASE Content
    ON wdev11=512
    LOG ON wdev14=256
go
USE master
go
EXEC sp_dboption 'Content','select into/bulkcopy/pllsort',true
go
USE Content
go
CHECKPOINT
go
USE Content
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Content') IS NOT NULL
    PRINT '<<< CREATED DATABASE Content >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Content >>>'
go

USE master
go
CREATE DATABASE ContentJava
    ON wdev1020=100
    LOG ON wdev1018=50
go
USE ContentJava
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('ContentJava') IS NOT NULL
    PRINT '<<< CREATED DATABASE ContentJava >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE ContentJava >>>'
go

USE master
go
CREATE DATABASE IVROnWeb
    ON wdev1020=248
    LOG ON wdev1019=50
go
USE IVROnWeb
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('IVROnWeb') IS NOT NULL
    PRINT '<<< CREATED DATABASE IVROnWeb >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE IVROnWeb >>>'
go

USE master
go
CREATE DATABASE IVRPictures
    ON wdev16=512
    LOG ON wdev17=100
go
USE IVRPictures
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('IVRPictures') IS NOT NULL
    PRINT '<<< CREATED DATABASE IVRPictures >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE IVRPictures >>>'
go

USE master
go
CREATE DATABASE Jump
    ON wdev17=256
    LOG ON wdev16=64
go
USE Jump
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Jump') IS NOT NULL
    PRINT '<<< CREATED DATABASE Jump >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Jump >>>'
go

USE master
go
CREATE DATABASE Member
    ON wdev9=2048,   
    wdev10=2048
    LOG ON wdev7=1024
go
ALTER DATABASE Member 
    ON wdev11=1024
go
ALTER DATABASE Member 
    ON wdev20=2048
go
ALTER DATABASE Member 
    ON wdev26=2048
go
ALTER DATABASE Member 
    ON wdev29=1000
go
USE Member
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Member') IS NOT NULL
    PRINT '<<< CREATED DATABASE Member >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Member >>>'
go

USE master
go
CREATE DATABASE Mobile
    ON wdev30=300
    LOG ON wdev1020=82
go
ALTER DATABASE Mobile 
    ON wdev30=300
go
ALTER DATABASE Mobile 
    ON wdev30=300
go
ALTER DATABASE Mobile 
    ON wdev30=300
go
ALTER DATABASE Mobile 
    LOG ON wdev1020=8
go
ALTER DATABASE Mobile 
    LOG ON wdev1020=68
go
ALTER DATABASE Mobile 
    ON wdev30=848
go
USE master
go
EXEC sp_dboption 'Mobile','abort tran on log full',true
go
EXEC sp_dboption 'Mobile','select into/bulkcopy/pllsort',true
go
EXEC sp_dboption 'Mobile','trunc log on chkpt',true
go
USE Mobile
go
CHECKPOINT
go
USE Mobile
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Mobile') IS NOT NULL
    PRINT '<<< CREATED DATABASE Mobile >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Mobile >>>'
go

USE master
go
CREATE DATABASE Msg_ad
    ON wdev101=2048,   
    wdev102=2048
    LOG ON wdev103=1024
go
ALTER DATABASE Msg_ad 
    ON wdev31=512
go
USE Msg_ad
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Msg_ad') IS NOT NULL
    PRINT '<<< CREATED DATABASE Msg_ad >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Msg_ad >>>'
go

USE master
go
CREATE DATABASE Msg_ai
    ON wdev104=2048,   
    wdev105=2048
    LOG ON wdev103=1024,       
    wdev1015=256
go
ALTER DATABASE Msg_ai 
    ON wdev106=2048
go
ALTER DATABASE Msg_ai 
    ON wdev1018=128
go
USE Msg_ai
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Msg_ai') IS NOT NULL
    PRINT '<<< CREATED DATABASE Msg_ai >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Msg_ai >>>'
go

USE master
go
CREATE DATABASE Msg_ar
    ON wdev107=2048,   
    wdev108=2048
    LOG ON wdev109=1024
go
USE Msg_ar
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Msg_ar') IS NOT NULL
    PRINT '<<< CREATED DATABASE Msg_ar >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Msg_ar >>>'
go

USE master
go
CREATE DATABASE Msg_md
    ON wdev1018=150
    LOG ON wdev1015=50
go
USE Msg_md
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Msg_md') IS NOT NULL
    PRINT '<<< CREATED DATABASE Msg_md >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Msg_md >>>'
go

USE master
go
CREATE DATABASE Msg_mi
    ON wdev1018=200
    LOG ON wdev1015=50
go
ALTER DATABASE Msg_mi 
    ON wdev1018=150
go
ALTER DATABASE Msg_mi 
    LOG ON wdev1015=50
go
USE Msg_mi
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Msg_mi') IS NOT NULL
    PRINT '<<< CREATED DATABASE Msg_mi >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Msg_mi >>>'
go

USE master
go
CREATE DATABASE Msg_mr
    ON wdev1018=150
    LOG ON wdev1015=50
go
USE Msg_mr
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Msg_mr') IS NOT NULL
    PRINT '<<< CREATED DATABASE Msg_mr >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Msg_mr >>>'
go

USE master
go
CREATE DATABASE Msg_wd
    ON wdev18=150
    LOG ON wdev17=50
go
USE Msg_wd
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Msg_wd') IS NOT NULL
    PRINT '<<< CREATED DATABASE Msg_wd >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Msg_wd >>>'
go

USE master
go
CREATE DATABASE Msg_wi
    ON wdev18=150
    LOG ON wdev17=50
go
ALTER DATABASE Msg_wi 
    ON wdev18=50
go
USE Msg_wi
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Msg_wi') IS NOT NULL
    PRINT '<<< CREATED DATABASE Msg_wi >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Msg_wi >>>'
go

USE master
go
CREATE DATABASE Msg_wr
    ON wdev18=150
    LOG ON wdev17=50
go
USE Msg_wr
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Msg_wr') IS NOT NULL
    PRINT '<<< CREATED DATABASE Msg_wr >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Msg_wr >>>'
go

USE master
go
CREATE DATABASE PartyMember
    ON wdev1023=1024
    LOG ON wdev1020=512
go
ALTER DATABASE PartyMember 
    ON wdev1023=1024
go
USE PartyMember
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('PartyMember') IS NOT NULL
    PRINT '<<< CREATED DATABASE PartyMember >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE PartyMember >>>'
go

USE master
go
CREATE DATABASE Profile_ad
    ON wdev1010=2048,   
    wdev1011=2048
    LOG ON wdev109=1024
go
ALTER DATABASE Profile_ad 
    ON wdev1012=2048
go
ALTER DATABASE Profile_ad 
    ON wdev1021=2048
go
USE Profile_ad
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Profile_ad') IS NOT NULL
    PRINT '<<< CREATED DATABASE Profile_ad >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Profile_ad >>>'
go

USE master
go
CREATE DATABASE Profile_ai
    ON wdev1013=2048,   
    wdev1014=2048
    LOG ON wdev1015=1536
go
ALTER DATABASE Profile_ai 
    ON wdev1016=2048
go
ALTER DATABASE Profile_ai 
    ON wdev1017=2048
go
ALTER DATABASE Profile_ai 
    ON wdev1022=2048
go
USE Profile_ai
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Profile_ai') IS NOT NULL
    PRINT '<<< CREATED DATABASE Profile_ai >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Profile_ai >>>'
go

USE master
go
CREATE DATABASE Profile_ar
    ON wdev12=2048,   
    wdev13=2048
    LOG ON wdev14=1024
go
ALTER DATABASE Profile_ar 
    ON wdev15=2048
go
ALTER DATABASE Profile_ar 
    ON wdev22=2048
go
USE Profile_ar
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Profile_ar') IS NOT NULL
    PRINT '<<< CREATED DATABASE Profile_ar >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Profile_ar >>>'
go

USE master
go
CREATE DATABASE Profile_md
    ON wdev1018=250
    LOG ON wdev1019=100
go
ALTER DATABASE Profile_md 
    ON wdev1018=50
go
ALTER DATABASE Profile_md 
    ON wdev1020=100
go
ALTER DATABASE Profile_md 
    ON wdev31=100
go
USE Profile_md
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Profile_md') IS NOT NULL
    PRINT '<<< CREATED DATABASE Profile_md >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Profile_md >>>'
go

USE master
go
CREATE DATABASE Profile_mi
    ON wdev1018=650
    LOG ON wdev1019=100
go
ALTER DATABASE Profile_mi 
    ON wdev1018=150
go
ALTER DATABASE Profile_mi 
    ON wdev1018=100
go
ALTER DATABASE Profile_mi 
    ON wdev1020=500
go
USE Profile_mi
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Profile_mi') IS NOT NULL
    PRINT '<<< CREATED DATABASE Profile_mi >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Profile_mi >>>'
go

USE master
go
CREATE DATABASE Profile_mr
    ON wdev1019=250
    LOG ON wdev1015=50
go
ALTER DATABASE Profile_mr 
    ON wdev1019=50
go
ALTER DATABASE Profile_mr 
    LOG ON wdev1020=50
go
ALTER DATABASE Profile_mr 
    ON wdev1019=100
go
USE Profile_mr
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Profile_mr') IS NOT NULL
    PRINT '<<< CREATED DATABASE Profile_mr >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Profile_mr >>>'
go

USE master
go
CREATE DATABASE Profile_wd
    ON wdev18=200
    LOG ON wdev17=50
go
ALTER DATABASE Profile_wd 
    ON wdev18=50
go
USE Profile_wd
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Profile_wd') IS NOT NULL
    PRINT '<<< CREATED DATABASE Profile_wd >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Profile_wd >>>'
go

USE master
go
CREATE DATABASE Profile_wi
    ON wdev18=500
    LOG ON wdev17=100
go
ALTER DATABASE Profile_wi 
    ON wdev31=100
go
USE Profile_wi
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Profile_wi') IS NOT NULL
    PRINT '<<< CREATED DATABASE Profile_wi >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Profile_wi >>>'
go

USE master
go
CREATE DATABASE Profile_wr
    ON wdev18=200
    LOG ON wdev17=50
go
USE Profile_wr
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Profile_wr') IS NOT NULL
    PRINT '<<< CREATED DATABASE Profile_wr >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Profile_wr >>>'
go

USE master
go
CREATE DATABASE SMSGateway
    ON wdev16=512
    LOG ON wdev14=128
go
ALTER DATABASE SMSGateway 
    ON wdev18=256
go
USE SMSGateway
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('SMSGateway') IS NOT NULL
    PRINT '<<< CREATED DATABASE SMSGateway >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE SMSGateway >>>'
go

USE master
go
CREATE DATABASE Session
    ON wdev17=256
    LOG ON wdev16=64
go
USE master
go
EXEC sp_dboption 'Session','abort tran on log full',true
go
EXEC sp_dboption 'Session','trunc log on chkpt',true
go
USE Session
go
CHECKPOINT
go
USE Session
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Session') IS NOT NULL
    PRINT '<<< CREATED DATABASE Session >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Session >>>'
go

USE master
go
CREATE DATABASE SuccessStory
    ON wdev1020=256
    LOG ON wdev1019=64
go
USE SuccessStory
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('SuccessStory') IS NOT NULL
    PRINT '<<< CREATED DATABASE SuccessStory >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE SuccessStory >>>'
go

USE master
go
CREATE DATABASE SurveyPoll
    ON wdev16=512
    LOG ON wdev14=256
go
ALTER DATABASE SurveyPoll 
    ON wdev17=128
go
USE SurveyPoll
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('SurveyPoll') IS NOT NULL
    PRINT '<<< CREATED DATABASE SurveyPoll >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE SurveyPoll >>>'
go

USE master
go
CREATE DATABASE Tracking
    ON wdev1020=100
    LOG ON wdev1020=24
    WITH OVERRIDE
go
USE Tracking
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('Tracking') IS NOT NULL
    PRINT '<<< CREATED DATABASE Tracking >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE Tracking >>>'
go

USE master
go
CREATE DATABASE USI
    ON wdev19=150
    LOG ON wdev17=100
go
ALTER DATABASE USI 
    ON wdev19=50
go
ALTER DATABASE USI 
    LOG ON wdev17=100
go
ALTER DATABASE USI 
    ON wdev19=1400
go
ALTER DATABASE USI 
    LOG ON wdev17=600
go
ALTER DATABASE USI 
    ON wdev19=48
go
ALTER DATABASE USI 
    ON wdev18=24
go
ALTER DATABASE USI 
    ON wdev19=376
go
ALTER DATABASE USI 
    ON wdev23=2048
go
ALTER DATABASE USI 
    ON wdev29=2048
go
ALTER DATABASE USI 
    LOG ON wdev1019=736
go
USE master
go
EXEC sp_dboption 'USI','abort tran on log full',true
go
EXEC sp_dboption 'USI','trunc log on chkpt',true
go
USE USI
go
CHECKPOINT
go
USE USI
go
EXEC sp_changedbowner 'sa'
go
IF DB_ID('USI') IS NOT NULL
    PRINT '<<< CREATED DATABASE USI >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE USI >>>'
go

