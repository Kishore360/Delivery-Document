
SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 
'MDS to DWH data validation failed for d_task_ci_c.task_class_type' ELSE 'SUCCESS' END as Message 
from (
select count(1) as cnt
from rogersdev_mdsdb.task_ci_final src 
left join rogersdev_mdsdb.task_final lkp on src.task=lkp.sys_id
join rogersdev_mdwdb.d_task_ci_c trgt on src.sys_id=trgt.row_id 
and src.sourceinstance=trgt.source_id 
where coalesce(lkp.sys_class_name,'UNSPECIFIED') <> trgt.task_class_type)a