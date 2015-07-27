  SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from usf_mdwdb.d_incident fi
join usf_mdsdb.incident_final f ON (fi.row_id =f.sys_id)
where fi.first_call_resolution_flag <> CASE WHEN f.u_closure_code='Quick Close' THEN 'Y' ELSE 'N' END) c