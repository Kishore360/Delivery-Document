SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from uclahealth_mdwdb.f_incident dfi
join uclahealth_mdsdb.incident_final incf
on dfi.row_id = incf.sys_id and dfi.source_id= incf.sourceinstance
where  dfi.child_incident_count_c <> u_child_incident_count )a;


