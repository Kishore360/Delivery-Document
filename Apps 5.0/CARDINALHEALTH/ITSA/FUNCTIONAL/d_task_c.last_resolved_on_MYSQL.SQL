SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  
cardinalhealth_mdsdb.task_final src
join cardinalhealth_mdwdb.d_task_c stg ON src.sys_id=stg.row_id AND src.sourceinstance=stg.source_id
LEFT JOIN cardinalhealth_mdsdb.sys_db_object_final sdbo ON sdbo.name = src.sys_class_name
join cardinalhealth_mdsdb.incident_final inc ON inc.sys_id = src.sys_id
where CASE
		   WHEN src.sys_class_name='incident' THEN 
CONVERT_TZ(inc.u_resolved_at,'GMT','America/New_York')
		   ELSE CONVERT_TZ(src.closed_at,'GMT','America/New_York')
	   END<>stg.last_resolved_on)c