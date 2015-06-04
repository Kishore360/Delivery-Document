SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from pgi_mdwdb.d_incident dfi
join pgi_mdsdb.incident_final incf on dfi.row_id = incf.sys_id and dfi.source_id= incf.sourceinstance
where
dfi.last_resolved_on <> CONVERT_TZ(incf.closed_at,"GMT","America/Los_Angeles"))c