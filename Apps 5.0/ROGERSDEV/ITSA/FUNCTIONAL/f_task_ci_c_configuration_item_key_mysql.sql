SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 
'MDS to DWH data validation failed for f_task_ci_c.configuration_item_key' ELSE 'SUCCESS' END as Message 
from (select count(1) as cnt
from rogersdev_mdsdb.task_ci_final src 
join rogersdev_mdwdb.f_task_ci_c trgt on src.sys_id=trgt.row_id 
and src.sourceinstance=trgt.source_id 
left join rogersdev_mdwdb.d_configuration_item lkp on coalesce(src.ci_item,'UNSPECIFIED')=lkp.row_id-- 657820 
where coalesce(lkp.row_key,case when src.ci_item is null then 0 else -1 end) <> trgt.configuration_item_key)a