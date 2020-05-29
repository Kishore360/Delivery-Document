select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.made_sla_flag' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.change_task_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 where coalesce(case when SRC.met_sla = True then 'Y' else 'N' end,'') <> coalesce(TRGT.made_sla_flag,'')
 
 

 

