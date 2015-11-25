SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from autotrader_workdb.dwh_d_incident dfi
JOIN autotrader_mdsdb.incident_final incf on dfi.row_id collate utf8_general_ci  = incf.sys_id anddfi.source_id=incf.sourceinstance
where dfi.last_resolved_on = CONVERT_TZ(incf.u_resolved,'GMT','America/New_York')) c 