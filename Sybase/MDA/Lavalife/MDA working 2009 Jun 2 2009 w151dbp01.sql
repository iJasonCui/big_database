set rowcount 0
SELECT --*
DBName,ProcName, count(*) as cn, avg(ElapsedTime), max(ElapsedTime) 
FROM "mda_user"."proc_stats"
WHERE SRVName = 'w151dbp01'
  AND ProcName in (
'wsp_newJumpUser',
'wsp_updJumpUserByCookieId',
'wsp_getJumpUserCookieByCId',
'wsp_saveAffiliateUser',
'wsp_updPublishUserByCookieId',
'wsp_saveAssociateCookie',
'wsp_saveAssociateCJCookie',
'wsp_saveAssociateBAMCookie',
'wsp_saveAssociateSEMCookie',
'wsp_updAssociateCookieUserId',
'wsp_updAssociateCJCookieUserId',
'wsp_updAssociateBAMCookieUId',
'wsp_updAssocSEMCookieUserId',
'wsp_getSiteInfoByCookieId',
'wsp_getSiteInfoCJByCookieId',
'wsp_getSiteInfoBAMByCookieId',
'wsp_getSiteInfoSEMByCookieId',
'wsp_getAssociateAdCode')
--and ProcName = 'gsp_cfgGetLocationSpc'
  --AND DBName != 'SMSGateway'
  --AND DBName = 'Jump'
  AND StartTime >= 'apr 14 2009'
--  AND StartTime <  'May 8 2009'
-- AND ElapsedTime > 200
--ORDER BY StartTime desc
--order by ElapsedTime desc
--order by LogicalReads desc
--group by DBName
group by DBName,ProcName
order by DBName, cn desc
;
