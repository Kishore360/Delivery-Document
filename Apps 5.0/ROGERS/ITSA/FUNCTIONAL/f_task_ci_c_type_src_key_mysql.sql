
SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 
'MDS to DWH data validation failed for f_task_ci_c.type_src_key' ELSE 'SUCCESS' END as Message 
from (
select count(1) as cnt
from rogers_mdsdb.task_ci_final src 
left join rogers_mdsdb.task_final lkp on src.task=lkp.sys_id
join rogers_mdwdb.f_task_ci_c trgt on src.sys_id=trgt.row_id 
and src.sourceinstance=trgt.source_id 
left join rogers_mdwdb.d_lov lkp1 on COALESCE( CONCAT('TASK_TYPE~TASK~~~',upper(lkp.sys_class_name )),'UNSPECIFIED')=lkp1.row_id
where coalesce(lkp1.row_key,case when lkp.sys_class_name is null then 0 else -1 end) <> trgt.type_src_key)a