SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from autotrader_workdb.dwh_d_incident fi
JOIN autotrader_mdsdb.incident_final f ON (fi.row_id COLLATE utf8_general_ci=f.sys_id andfi.source_id=f.sourceinstance)
where fi.first_call_resolution_flag <> CASE WHEN f.reassignment_count <> 0 THEN 'N' ELSE 'Y' END) c
 