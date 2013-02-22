/*
SELECT 'drop subscription "' + s.subname + '" for database replication definition "' + o.dbrepname 
     + '" with primary at "' + p.dsname + '"."' + p.dbname
     + '" with replicate at "' + d.dsname + '"."' + d.dbname + '" without purge' 
FROM   rep5p_RSSD..rs_subscriptions s, rep5p_RSSD..rs_databases p, rep5p_RSSD..rs_databases d, rep5p_RSSD..rs_dbreps o
WHERE  s.pdbid = p.dbid and s.dbid = d.dbid and s.pdbid  = o.dbid and s.subname like "w151dbp02%"

*/


drop subscription "w151dbp02_IVROnWeb" for database replication definition "IVROnWeb" with primary at "LogicalSRV"."IVROnWeb" with replicate at "w151dbp02L"."IVROnWeb_view" without purge
drop subscription "w151dbp02_Profile_md" for database replication definition "Profile_md" with primary at "LogicalSRV"."Profile_md" with replicate at "w151dbp02L"."Profile_md_view" without purge
drop subscription "w151dbp02_Profile_mr" for database replication definition "Profile_mr" with primary at "LogicalSRV"."Profile_mr" with replicate at "w151dbp02L"."Profile_mr_view" without purge
drop subscription "w151dbp02_Profile_mi" for database replication definition "Profile_mi" with primary at "LogicalSRV"."Profile_mi" with replicate at "w151dbp02L"."Profile_mi_view" without purge
drop subscription "w151dbp02_Profile_wd" for database replication definition "Profile_wd" with primary at "LogicalSRV"."Profile_wd" with replicate at "w151dbp02L"."Profile_wd_view" without purge
drop subscription "w151dbp02_Profile_wr" for database replication definition "Profile_wr" with primary at "LogicalSRV"."Profile_wr" with replicate at "w151dbp02L"."Profile_wr_view" without purge
drop subscription "w151dbp02_Profile_wi" for database replication definition "Profile_wi" with primary at "LogicalSRV"."Profile_wi" with replicate at "w151dbp02L"."Profile_wi_view" without purge
drop subscription "w151dbp02_Msg_ad" for database replication definition "Msg_ad" with primary at "LogicalSRV"."Msg_ad" with replicate at "w151dbp02L"."Msg_ad_view" without purge
drop subscription "w151dbp02_Msg_ar" for database replication definition "Msg_ar" with primary at "LogicalSRV"."Msg_ar" with replicate at "w151dbp02L"."Msg_ar_view" without purge
drop subscription "w151dbp02_Msg_ai" for database replication definition "Msg_ai" with primary at "LogicalSRV"."Msg_ai" with replicate at "w151dbp02L"."Msg_ai_view" without purge
drop subscription "w151dbp02_USI" for database replication definition "USI" with primary at "LogicalSRV"."USI" with replicate at "w151dbp02L"."USI_view" without purge
drop subscription "w151dbp02_Msg_md" for database replication definition "Msg_md" with primary at "LogicalSRV"."Msg_md" with replicate at "w151dbp02L"."Msg_md_view" without purge
drop subscription "w151dbp02_Msg_mr" for database replication definition "Msg_mr" with primary at "LogicalSRV"."Msg_mr" with replicate at "w151dbp02L"."Msg_mr_view" without purge
drop subscription "w151dbp02_Msg_mi" for database replication definition "Msg_mi" with primary at "LogicalSRV"."Msg_mi" with replicate at "w151dbp02L"."Msg_mi_view" without purge
drop subscription "w151dbp02_Msg_wr" for database replication definition "Msg_wr" with primary at "LogicalSRV"."Msg_wr" with replicate at "w151dbp02L"."Msg_wr_view" without purge
drop subscription "w151dbp02_Msg_wi" for database replication definition "Msg_wi" with primary at "LogicalSRV"."Msg_wi" with replicate at "w151dbp02L"."Msg_wi_view" without purge
drop subscription "w151dbp02_SuccessStory" for database replication definition "SuccessStory" with primary at "LogicalSRV"."SuccessStory" with replicate at "w151dbp02L"."SuccessStory_view" without purge
drop subscription "w151dbp02_Msg_wd" for database replication definition "Msg_wd" with primary at "LogicalSRV"."Msg_wd" with replicate at "w151dbp02L"."Msg_wd_view" without purge

go


