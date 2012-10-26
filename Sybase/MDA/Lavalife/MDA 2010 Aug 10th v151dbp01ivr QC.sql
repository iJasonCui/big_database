--set rowcount 100
SELECT --*
DBName , 
ProcName, count(*), avg(ElapsedTime), max(ElapsedTime), MIN(ElapsedTime)
FROM "mda_user"."proc_stats"
WHERE 
SRVName = 'v151dbp01ivr' 
--SRVName = 'v151db20'
--AND ProcName = 'gsp_newSessid'
--AND ProcName = 'gsp_newIVRMailbox'
--and ProcName in ( 'gsp_getBDAdCounts') 
--and ProcName in ( 'gsp_getCMGrtCounts')
and ProcName in ('gsp_newBoxnum')
--AND ProcName like '%QC%'
--AND DBName = 'canNH'
-- AND DBName in ('chiLL') --, 'laxLL')
--and DBName in ('mtlNEF', 'sfoNE', 'torNE')
  AND StartTime >= '2010-08-26 '
  AND StartTime <  '2010-08-27 '
 -- AND EndTime >= '2010-05-06 13:56'
  --AND EndTime <  '2010-05-06 14:01'
--  AND ElapsedTime > 200
--ORDER BY StartTime desc
--order by ElapsedTime desc
--order by logicalReads desc
group by DBName , ProcName
;
