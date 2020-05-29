select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.configuration_item_key' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.change_task_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
left join #DWH_TABLE_SCHEMA.d_configuration_item d
 on d.row_id = SRC.cmdb_ci
  AND SRC.sourceinstance = d.source_id 
 where coalesce(d.row_key,case when SRC.cmdb_ci is null then 0 else -1 end ) <> coalesce(TRGT.configuration_item_key,'')
 
 



