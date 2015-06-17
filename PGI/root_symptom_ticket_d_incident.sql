SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from pgi_mdwdb.d_incident sfi join
pgi_mdsdb.u_external_incident_final inc on sfi.row_id = inc.sys_id
and sfi.source_id = inc.sourceinstance
where
sfi.root_category  <> coalesce(inc.u_root_cause_level_1,'UNSPECIFIED') or
sfi.symptom_category  <> coalesce(inc.u_symptom_main_category,'UNSPECIFIED') or
sfi.symptom_sub_category  <> coalesce(inc.u_symptom_sub_category,'UNSPECIFIED') or
sfi.ticket_type <> coalesce(inc.u_trouble_ticket_type,'UNSPECIFIED'))c