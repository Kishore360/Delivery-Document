
SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 
'MDS to DWH data validation failed for f_task_ci_c.created_on' ELSE 'SUCCESS' END as Message 
from (
select count(1) as cnt
from rogersdev_mdsdb.task_ci_final src 
join rogersdev_mdwdb.d_task_ci_c trgt on src.sys_id=trgt.row_id 
and src.sourceinstance=trgt.source_id 
where CONVERT_TZ(src.sys_created_on,'GMT','America/New_York') <> trgt.created_on)a