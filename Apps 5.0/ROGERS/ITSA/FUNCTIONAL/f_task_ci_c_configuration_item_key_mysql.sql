SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 
'MDS to DWH data validation failed for f_task_ci_c.configuration_item_key' ELSE 'SUCCESS' END as Message 
from (select count(1) as cnt
from rogers_mdsdb.task_ci_final src 
join rogers_mdsdb.task_final src1 on src.task=src1.sys_id and src.sourceinstance=src1.sourceinstance
join rogers_mdwdb.f_task_ci_c trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 
left join rogers_mdwdb.d_configuration_item lkp on src.ci_item=lkp.row_id  and src.sourceinstance=lkp.source_id
where sys_class_name='problem' and coalesce(lkp.row_key,case when src.ci_item is null then 0 else -1 end) <> trgt.configuration_item_key)a