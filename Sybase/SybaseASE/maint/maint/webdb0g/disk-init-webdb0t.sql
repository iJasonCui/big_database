USE master
go
DISK INIT
    NAME='wdev1',
    PHYSNAME='/data/dump/webdb0t/wdev1',
    VDEVNO=5,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1')
    PRINT '<<< CREATED DATABASE DEVICE wdev1 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1 >>>'
go

USE master
go
DISK INIT
    NAME='wdev10',
    PHYSNAME='/data/dump/webdb0t/wdev10',
    VDEVNO=14,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev10',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev10')
    PRINT '<<< CREATED DATABASE DEVICE wdev10 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev10 >>>'
go

USE master
go
DISK INIT
    NAME='wdev101',
    PHYSNAME='/data/dump/webdb0t/wdev101',
    VDEVNO=45,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev101',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev101')
    PRINT '<<< CREATED DATABASE DEVICE wdev101 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev101 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1010',
    PHYSNAME='/data/dump/webdb0t/wdev1010',
    VDEVNO=54,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1010',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1010')
    PRINT '<<< CREATED DATABASE DEVICE wdev1010 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1010 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1011',
    PHYSNAME='/data/dump/webdb0t/wdev1011',
    VDEVNO=55,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1011',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1011')
    PRINT '<<< CREATED DATABASE DEVICE wdev1011 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1011 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1012',
    PHYSNAME='/data/dump/webdb0t/wdev1012',
    VDEVNO=56,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1012',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1012')
    PRINT '<<< CREATED DATABASE DEVICE wdev1012 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1012 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1013',
    PHYSNAME='/data/dump/webdb0t/wdev1013',
    VDEVNO=57,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1013',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1013')
    PRINT '<<< CREATED DATABASE DEVICE wdev1013 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1013 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1014',
    PHYSNAME='/data/dump/webdb0t/wdev1014',
    VDEVNO=58,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1014',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1014')
    PRINT '<<< CREATED DATABASE DEVICE wdev1014 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1014 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1015',
    PHYSNAME='/data/dump/webdb0t/wdev1015',
    VDEVNO=59,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1015',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1015')
    PRINT '<<< CREATED DATABASE DEVICE wdev1015 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1015 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1016',
    PHYSNAME='/data/dump/webdb0t/wdev1016',
    VDEVNO=60,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1016',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1016')
    PRINT '<<< CREATED DATABASE DEVICE wdev1016 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1016 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1017',
    PHYSNAME='/data/dump/webdb0t/wdev1017',
    VDEVNO=61,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1017',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1017')
    PRINT '<<< CREATED DATABASE DEVICE wdev1017 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1017 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1018',
    PHYSNAME='/data/dump/webdb0t/wdev1018',
    VDEVNO=62,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1018',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1018')
    PRINT '<<< CREATED DATABASE DEVICE wdev1018 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1018 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1019',
    PHYSNAME='/data/dump/webdb0t/wdev1019',
    VDEVNO=63,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1019',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1019')
    PRINT '<<< CREATED DATABASE DEVICE wdev1019 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1019 >>>'
go

USE master
go
DISK INIT
    NAME='wdev102',
    PHYSNAME='/data/dump/webdb0t/wdev102',
    VDEVNO=46,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev102',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev102')
    PRINT '<<< CREATED DATABASE DEVICE wdev102 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev102 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1020',
    PHYSNAME='/data/dump/webdb0t/wdev1020',
    VDEVNO=64,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1020',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1020')
    PRINT '<<< CREATED DATABASE DEVICE wdev1020 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1020 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1021',
    PHYSNAME='/data/dump/webdb0t/wdev1021',
    VDEVNO=65,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1021',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1021')
    PRINT '<<< CREATED DATABASE DEVICE wdev1021 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1021 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1022',
    PHYSNAME='/data/dump/webdb0t/wdev1022',
    VDEVNO=66,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1022',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1022')
    PRINT '<<< CREATED DATABASE DEVICE wdev1022 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1022 >>>'
go

USE master
go
DISK INIT
    NAME='wdev1023',
    PHYSNAME='/data/dump/webdb0t/wdev1023',
    VDEVNO=67,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev1023',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev1023')
    PRINT '<<< CREATED DATABASE DEVICE wdev1023 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev1023 >>>'
go

USE master
go
DISK INIT
    NAME='wdev103',
    PHYSNAME='/data/dump/webdb0t/wdev103',
    VDEVNO=47,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev103',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev103')
    PRINT '<<< CREATED DATABASE DEVICE wdev103 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev103 >>>'
go

USE master
go
DISK INIT
    NAME='wdev104',
    PHYSNAME='/data/dump/webdb0t/wdev104',
    VDEVNO=48,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev104',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev104')
    PRINT '<<< CREATED DATABASE DEVICE wdev104 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev104 >>>'
go

USE master
go
DISK INIT
    NAME='wdev105',
    PHYSNAME='/data/dump/webdb0t/wdev105',
    VDEVNO=49,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev105',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev105')
    PRINT '<<< CREATED DATABASE DEVICE wdev105 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev105 >>>'
go

USE master
go
DISK INIT
    NAME='wdev106',
    PHYSNAME='/data/dump/webdb0t/wdev106',
    VDEVNO=50,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev106',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev106')
    PRINT '<<< CREATED DATABASE DEVICE wdev106 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev106 >>>'
go

USE master
go
DISK INIT
    NAME='wdev107',
    PHYSNAME='/data/dump/webdb0t/wdev107',
    VDEVNO=51,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev107',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev107')
    PRINT '<<< CREATED DATABASE DEVICE wdev107 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev107 >>>'
go

USE master
go
DISK INIT
    NAME='wdev108',
    PHYSNAME='/data/dump/webdb0t/wdev108',
    VDEVNO=52,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev108',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev108')
    PRINT '<<< CREATED DATABASE DEVICE wdev108 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev108 >>>'
go

USE master
go
DISK INIT
    NAME='wdev109',
    PHYSNAME='/data/dump/webdb0t/wdev109',
    VDEVNO=53,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev109',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev109')
    PRINT '<<< CREATED DATABASE DEVICE wdev109 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev109 >>>'
go

USE master
go
DISK INIT
    NAME='wdev11',
    PHYSNAME='/data/dump/webdb0t/wdev11',
    VDEVNO=15,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev11',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev11')
    PRINT '<<< CREATED DATABASE DEVICE wdev11 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev11 >>>'
go

USE master
go
DISK INIT
    NAME='wdev12',
    PHYSNAME='/data/dump/webdb0t/wdev12',
    VDEVNO=16,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev12',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev12')
    PRINT '<<< CREATED DATABASE DEVICE wdev12 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev12 >>>'
go

USE master
go
DISK INIT
    NAME='wdev13',
    PHYSNAME='/data/dump/webdb0t/wdev13',
    VDEVNO=17,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev13',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev13')
    PRINT '<<< CREATED DATABASE DEVICE wdev13 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev13 >>>'
go

USE master
go
DISK INIT
    NAME='wdev14',
    PHYSNAME='/data/dump/webdb0t/wdev14',
    VDEVNO=18,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev14',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev14')
    PRINT '<<< CREATED DATABASE DEVICE wdev14 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev14 >>>'
go

USE master
go
DISK INIT
    NAME='wdev15',
    PHYSNAME='/data/dump/webdb0t/wdev15',
    VDEVNO=19,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev15',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev15')
    PRINT '<<< CREATED DATABASE DEVICE wdev15 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev15 >>>'
go

USE master
go
DISK INIT
    NAME='wdev16',
    PHYSNAME='/data/dump/webdb0t/wdev16',
    VDEVNO=20,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev16',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev16')
    PRINT '<<< CREATED DATABASE DEVICE wdev16 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev16 >>>'
go

USE master
go
DISK INIT
    NAME='wdev17',
    PHYSNAME='/data/dump/webdb0t/wdev17',
    VDEVNO=21,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev17',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev17')
    PRINT '<<< CREATED DATABASE DEVICE wdev17 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev17 >>>'
go

USE master
go
DISK INIT
    NAME='wdev18',
    PHYSNAME='/data/dump/webdb0t/wdev18',
    VDEVNO=22,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev18',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev18')
    PRINT '<<< CREATED DATABASE DEVICE wdev18 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev18 >>>'
go

USE master
go
DISK INIT
    NAME='wdev19',
    PHYSNAME='/data/dump/webdb0t/wdev19',
    VDEVNO=23,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev19',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev19')
    PRINT '<<< CREATED DATABASE DEVICE wdev19 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev19 >>>'
go

USE master
go
DISK INIT
    NAME='wdev2',
    PHYSNAME='/data/dump/webdb0t/wdev2',
    VDEVNO=6,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev2',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev2')
    PRINT '<<< CREATED DATABASE DEVICE wdev2 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev2 >>>'
go

USE master
go
DISK INIT
    NAME='wdev20',
    PHYSNAME='/data/dump/webdb0t/wdev20',
    VDEVNO=24,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev20',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev20')
    PRINT '<<< CREATED DATABASE DEVICE wdev20 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev20 >>>'
go

USE master
go
DISK INIT
    NAME='wdev21',
    PHYSNAME='/data/dump/webdb0t/wdev21',
    VDEVNO=25,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev21',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev21')
    PRINT '<<< CREATED DATABASE DEVICE wdev21 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev21 >>>'
go

USE master
go
DISK INIT
    NAME='wdev22',
    PHYSNAME='/data/dump/webdb0t/wdev22.dev',
    VDEVNO=26,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev22',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev22')
    PRINT '<<< CREATED DATABASE DEVICE wdev22 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev22 >>>'
go

USE master
go
DISK INIT
    NAME='wdev23',
    PHYSNAME='/data/dump/webdb0t/wdev23.dev',
    VDEVNO=27,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev23',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev23')
    PRINT '<<< CREATED DATABASE DEVICE wdev23 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev23 >>>'
go

USE master
go
DISK INIT
    NAME='wdev24',
    PHYSNAME='/data/dump/webdb0t/wdev24.dev',
    VDEVNO=28,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev24',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev24')
    PRINT '<<< CREATED DATABASE DEVICE wdev24 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev24 >>>'
go

USE master
go
DISK INIT
    NAME='wdev25',
    PHYSNAME='/data/dump/webdb0t/wdev25',
    VDEVNO=29,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev25',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev25')
    PRINT '<<< CREATED DATABASE DEVICE wdev25 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev25 >>>'
go

USE master
go
DISK INIT
    NAME='wdev26',
    PHYSNAME='/usr/l/data/db/webdb0t/wdev26',
    VDEVNO=30,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev26',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev26')
    PRINT '<<< CREATED DATABASE DEVICE wdev26 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev26 >>>'
go

USE master
go
DISK INIT
    NAME='wdev29',
    PHYSNAME='/usr/l/data/db/webdb0t/wdev29',
    VDEVNO=4,
    SIZE=2097152,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev29',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev29')
    PRINT '<<< CREATED DATABASE DEVICE wdev29 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev29 >>>'
go

USE master
go
DISK INIT
    NAME='wdev3',
    PHYSNAME='/data/dump/webdb0t/wdev3',
    VDEVNO=7,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev3',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev3')
    PRINT '<<< CREATED DATABASE DEVICE wdev3 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev3 >>>'
go

USE master
go
DISK INIT
    NAME='wdev30',
    PHYSNAME='/usr/l/data/db/webdb0t/wdev30',
    VDEVNO=31,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev30',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev30')
    PRINT '<<< CREATED DATABASE DEVICE wdev30 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev30 >>>'
go

USE master
go
DISK INIT
    NAME='wdev31',
    PHYSNAME='/usr/l/data/db/webdb0t/wdev31',
    VDEVNO=32,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev31',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev31')
    PRINT '<<< CREATED DATABASE DEVICE wdev31 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev31 >>>'
go

USE master
go
DISK INIT
    NAME='wdev4',
    PHYSNAME='/data/dump/webdb0t/wdev4',
    VDEVNO=8,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev4',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev4')
    PRINT '<<< CREATED DATABASE DEVICE wdev4 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev4 >>>'
go

USE master
go
DISK INIT
    NAME='wdev5',
    PHYSNAME='/data/dump/webdb0t/wdev5',
    VDEVNO=9,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev5',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev5')
    PRINT '<<< CREATED DATABASE DEVICE wdev5 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev5 >>>'
go

USE master
go
DISK INIT
    NAME='wdev6',
    PHYSNAME='/data/dump/webdb0t/wdev6',
    VDEVNO=10,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev6',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev6')
    PRINT '<<< CREATED DATABASE DEVICE wdev6 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev6 >>>'
go

USE master
go
DISK INIT
    NAME='wdev7',
    PHYSNAME='/data/dump/webdb0t/wdev7',
    VDEVNO=11,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev7',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev7')
    PRINT '<<< CREATED DATABASE DEVICE wdev7 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev7 >>>'
go

USE master
go
DISK INIT
    NAME='wdev8',
    PHYSNAME='/data/dump/webdb0t/wdev8',
    VDEVNO=12,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev8',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev8')
    PRINT '<<< CREATED DATABASE DEVICE wdev8 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev8 >>>'
go

USE master
go
DISK INIT
    NAME='wdev9',
    PHYSNAME='/data/dump/webdb0t/wdev9',
    VDEVNO=13,
    SIZE=1048576,
    VSTART=0,
    CNTRLTYPE=0, 
    DSYNC=false
go
EXEC sp_diskdefault 'wdev9',defaultoff
go
IF EXISTS (SELECT * FROM master.dbo.sysdevices WHERE name='wdev9')
    PRINT '<<< CREATED DATABASE DEVICE wdev9 >>>'
ELSE
    PRINT '<<< FAILED CREATING DATABASE DEVICE wdev9 >>>'
go

