select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.sys_mod_count' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_task_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_problem_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 where coalesce(TRGT.update_count,'') <> coalesce(SRC.sys_mod_count,0)


 



