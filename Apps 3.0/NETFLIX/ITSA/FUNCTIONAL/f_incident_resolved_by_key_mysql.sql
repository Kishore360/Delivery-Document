SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN concat('Data did not Match: ',cnt) 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from netflix_mdwdb.f_incident dfi 
join (SELECT sys_id, sourceinstance, closed_at, closed_by from netflix_mdsdb.incident_final) incf 
on dfi.row_id = incf.sys_id and dfi.source_id= incf.sourceinstance 
join netflix_mdwdb.d_internal_contact ic on ic.row_id=concat('INTERNAL_CONTACT~',incf.closed_by) 
Where dfi.last_resolved_on_key <> COALESCE(DATE_FORMAT(CONVERT_TZ(incf.closed_at,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED') 
or dfi.last_resolved_by_key <> ic.row_key)c;
 
 
 
 