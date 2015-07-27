SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from incomm_mdwdb.d_incident fi JOIN incomm_mdsdb.incident_final i ON (fi.row_id collate utf8_general_ci=i.sys_id AND fi.source_id=i.sourceinstance) and fi.first_call_resolution_flag <> CASE WHEN i.u_first_call_resolution ='first call resolved' THEN 'Y' ELSE 'N' END)c