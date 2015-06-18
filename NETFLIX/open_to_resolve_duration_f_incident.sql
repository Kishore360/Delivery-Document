SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from netflix_mdwdb.f_incident dfi join (SELECT sys_id, sourceinstance, TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',business_duration) as business_duration from netflix_mdsdb.incident_final) incf on dfi.row_id = incf.sys_id and dfi.source_id= incf.sourceinstance and dfi.open_to_resolve_duration <> incf.business_duration )c;