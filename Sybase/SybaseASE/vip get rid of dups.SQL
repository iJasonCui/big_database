select userId,min(signupDateTime) as signupDateTime ,max(signupDateTime) as max_signupDateTime,count(*) as row_count
--into Inactive14DaysEmail_2004Mar27
from Inactive14DaysEmail 
group by userId
having count(*) >= 2



select a.*
into Inactive14DaysEmail_04Mar27
from Inactive14DaysEmail a, Inactive14DaysEmail_2004Mar27 b
where a.userId = b.userId and a.signupDateTime = b.signupDateTime


select *
into Inactive14DaysEmail_dup
from Inactive14DaysEmail where userId IN (SELECT userId from Inactive14DaysEmail_2004Mar27)

--delete from Inactive14DaysEmail where userId IN (SELECT userId from Inactive14DaysEmail_2004Mar27)

insert Inactive14DaysEmail
select * from Inactive14DaysEmail_04Mar27


