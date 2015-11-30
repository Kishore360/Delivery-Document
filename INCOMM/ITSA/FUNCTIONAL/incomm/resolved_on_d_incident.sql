SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from incomm_mdwdb.d_incident dfi 
join (SELECT sys_id, sourceinstance, u_resolved_on as closed_at from incomm_mdsdb.incident_final) incf 
on dfi.row_id  collate utf8_general_ci= incf.sys_id and dfi.source_id= incf.sourceinstance and dfi.last_resolved_on <> CONVERT_TZ(incf.closed_at,'GMT','America/New_York'))c;