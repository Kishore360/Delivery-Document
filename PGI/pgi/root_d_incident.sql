SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from pgi_workdb.dwh_d_incident sfi join
pgi_mdsdb.u_internal_incident_final inc on
sfi.row_id collate utf8_general_ci  = inc.sys_id and sfi.source_id  = inc.sourceinstance
where
sfi.root_category collate utf8_general_ci <> coalesce(inc.u_root_category,'UNSPECIFIED') or
sfi.root_cause collate utf8_general_ci <>  coalesce(inc.u_root_cause,'UNSPECIFIED') or
sfi.root_issue collate utf8_general_ci <> coalesce(inc.u_root_issue,'UNSPECIFIED'))c

