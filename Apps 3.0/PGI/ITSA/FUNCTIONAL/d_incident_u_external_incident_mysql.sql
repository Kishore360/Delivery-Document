SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from pgi_mdsdb.u_external_incident_final a
inner join pgi_mdwdb.d_incident b on a.sys_id = b.row_id and a.sourceinstance = b.source_id
where
requires_review_flag <> case when a.u_flag_for_review = 1 then 'Y' else 'N' end or
area_of_focus  <> coalesce(a.u_area_of_focus,'UNSPECIFIED') or
caller_type  <> coalesce(a.u_caller_type,'UNSPECIFIED') or
company_name <> coalesce(a.u_company_name,'UNSPECIFIED') or
enterprise_name  <> coalesce(a.u_enterprise_name,'UNSPECIFIED') or
source_channel <> coalesce(a.u_ticket_initiated_from,'UNSPECIFIED') or
b.symptom_sub_category <> coalesce(a.u_symptom_sub_category,'UNSPECIFIED') OR
b.ticket_type <>coalesce(a.u_trouble_ticket_type,'UNSPECIFIED') or 
b.external_flag <>'Y' or
service_restoration_flag <> case when u_service_restored = 1 then 'Y' else 'N' end)c