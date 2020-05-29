SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for #DWH_TABLE_NAME' ELSE 'SUCCESS' END as Message
from  #MDS_TABLE_SCHEMA.change_task_final SRC
left join #DWH_TABLE_SCHEMA.d_change_task TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id 
)
WHERE CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
