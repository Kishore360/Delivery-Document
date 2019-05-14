
SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 
'MDS to DWH data validation failed for d_task_ci_c.opened_on' ELSE 'SUCCESS' END as Message 
from (
select count(1) as cnt
from rogers_mdsdb.task_ci_final src 
join rogers_mdwdb.d_task_ci_c trgt on src.sys_id=trgt.row_id 
and src.sourceinstance=trgt.source_id 
left join rogers_mdwdb.d_task lkp on src. task=lkp.row_id-- 657820 
where lkp.opened_on <> trgt.opened_on)a