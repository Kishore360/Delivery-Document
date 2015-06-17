SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from autotrader_workdb.dwh_f_incident fi
JOIN autotrader_mdsdb.incident_final f ON (fi.row_id COLLATE utf8_general_ci=f.sys_id andfi.source_id=f.sourceinstance)
where fi.open_to_resolve_duration <> timestampdiff(second,'1970-01-01 00:00:00',f.u_mttr_duration)) c

 
