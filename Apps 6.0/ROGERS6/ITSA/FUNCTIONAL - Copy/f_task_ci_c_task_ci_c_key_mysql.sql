SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 'MDS to DWH data validation failed for f_task_ci_c.task_ci_c_key' ELSE 'SUCCESS' END as Message 
from (select count(1) as cnt
from rogers_mdsdb.task_ci_final src 
join rogers_mdsdb.task_final src1 on src.task=src1.sys_id and src.sourceinstance=src1.sourceinstance
join rogers_mdwdb.f_task_ci_c trgt 
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 
left join rogers_mdwdb.d_task_ci_c  lkp 
on COALESCE( src.sys_id ,'UNSPECIFIED')=lkp.row_id  and src.sourceinstance=lkp.source_id
where  coalesce(lkp.row_key,case when src.sys_id is null then 0 else -1 end) <> trgt.task_ci_c_key 
and src.CDCTYPE='X' and src1.CDCTYPE='X')a