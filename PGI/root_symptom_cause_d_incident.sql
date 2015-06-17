SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from pgi_mdwdb.d_incident sfi join
pgi_mdsdb.u_internal_incident_final inc on
sfi.row_id = inc.sys_id and sfi.source_id  = inc.sourceinstance
where
sfi.root_category  <> coalesce(inc.u_root_category,'UNSPECIFIED') or
sfi.root_cause  <>  coalesce(inc.u_root_cause,'UNSPECIFIED') or
sfi.root_issue <> coalesce(inc.u_root_issue,'UNSPECIFIED') or
sfi.symptom_category  <> coalesce(inc.u_symptom_main_category,'UNSPECIFIED') or
sfi.symptom_sub_category <> coalesce(inc.u_symptom_sub_category,'UNSPECIFIED') or
sfi.ticket_type <> coalesce(inc.u_ticket_type,'UNSPECIFIED') or
sfi.cause_code<> coalesce(inc.u_cause_code,'UNSPECIFIED')) c

