SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from cardinalhealth_mdwdb.d_task stg 
JOIN cardinalhealth_mdsdb.task_final src ON src.sys_id=stg.row_id 
	AND src.sourceinstance=stg.source_id
LEFT JOIN cardinalhealth_mdsdb.sys_db_object_final sdbo 
ON sdbo.name = src.sys_class_name
LEFT JOIN cardinalhealth_mdsdb.incident_final inc ON inc.sys_id = src.sys_id and inc.sourceinstance=src.sourceinstance
where COALESCE(CASE
		   WHEN src.sys_class_name='incident' THEN CONVERT_TZ(inc.u_resolved_at,'America/New_York','GMT')
		   ELSE CONVERT_TZ(src.closed_at,'America/New_York','GMT') END,'UNSPECIFIED') <>stg.last_resolved_on_c)c