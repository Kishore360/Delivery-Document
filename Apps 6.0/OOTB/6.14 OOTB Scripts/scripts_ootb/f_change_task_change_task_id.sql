select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.change_task_id' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.change_task_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 left join #DWH_TABLE_SCHEMA.f_change_request f
 on f.row_id=SRC.sys_id
 where coalesce(f.row_key,'') <> coalesce(TRGT.change_task_key,'')
 


