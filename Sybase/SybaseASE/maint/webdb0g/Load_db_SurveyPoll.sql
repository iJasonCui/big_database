PRINT "========================" 
SELECT GETDATE()

LOAD DATABASE SurveyPoll FROM '/webdb0r_nfs/data/dump/webdb27p/SurveyPoll/SurveyPoll-dba-1'
go

SELECT GETDATE()
PRINT "========================" 
go
ONLINE DATABASE SurveyPoll
PRINT "========================" 
go
