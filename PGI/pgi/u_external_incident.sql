SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from pgi_mdsdb.u_external_incident_final a
inner join pgi_workdb.dwh_d_incident b on a.sys_id collate utf8_unicode_ci = b.row_id and a.sourceinstance = b.source_id
where
requires_review_flag <> case when a.u_flag_for_review = 1 then 'Y' else 'N' end or
area_of_focus collate utf8_general_ci <> coalesce(a.u_area_of_focus,'UNSPECIFIED') or
caller_type collate utf8_general_ci <> coalesce(a.u_caller_type,'UNSPECIFIED') or
company_name collate utf8_general_ci <> coalesce(a.u_company_name,'UNSPECIFIED') or
enterprise_name collate utf8_general_ci <> coalesce(a.u_enterprise_name,'UNSPECIFIED') or
source_channel collate utf8_general_ci <> coalesce(a.u_ticket_initiated_from,'UNSPECIFIED') or
service_restoration_flag collate utf8_general_ci <> case when u_service_restored = 1 then 'Y' else 'N' end or
first_call_resolution_flag  collate utf8_general_ci<> case when u_first_call_resolution = 1 then 'Y' else 'N' end)c