SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from pgi_mdwdb.d_incident sfi join
pgi_mdsdb.u_internal_incident_final inc on
sfi.row_id   = inc.sys_id and sfi.source_id  = inc.sourceinstance
where sfi.root_category  <> coalesce(inc.u_root_category,'UNSPECIFIED') or
sfi.symptom_sub_category <> coalesce(inc.u_symptom_sub_category,'UNSPECIFIED') OR
sfi.symptom_category <> coalesce(inc.u_symptom_main_category,'UNSPECIFIED') or
sfi.ticket_type <>coalesce(inc.u_ticket_type,'UNSPECIFIED') or 
sfi.cause_code<> coalesce(inc.u_cause_code,'UNSPECIFIED') or
sfi.root_cause1<>  coalesce(inc.u_cause_code__deskside_,'UNSPECIFIED') or
sfi.source_name_c<>inc.u_source or
sfi.external_flag <>'N' or
sfi.requires_review_flag <> case when inc.u_flag_for_review = 1 then 'Y' else 'N' end or
sfi.area_of_focus  <> coalesce(inc.u_area_of_focus,'UNSPECIFIED') or
sfi.company_name <> coalesce(inc.u_company_name,'UNSPECIFIED') or
sfi.enterprise_name  <> coalesce(inc.u_enterprise_name,'UNSPECIFIED') or
sfi.source_channel <> coalesce(inc.u_source,'UNSPECIFIED') or
sfi.service_restoration_flag <> case when inc.u_service_restored = 1 then 'Y' else 'N' end)c; 