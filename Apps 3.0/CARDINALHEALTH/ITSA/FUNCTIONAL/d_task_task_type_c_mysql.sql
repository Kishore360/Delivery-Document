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
where stg.soft_deleted_flag='N' and COALESCE(sdbo.label,'UNSPECIFIED')<>stg.task_type_c)c