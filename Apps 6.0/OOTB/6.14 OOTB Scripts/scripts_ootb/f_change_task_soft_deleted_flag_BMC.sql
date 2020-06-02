SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.soft_deleted_flag' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC
left join (SELECT * FROM #DWH_TABLE_SCHEMA.f_change_task) TRGT 
ON (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id)
WHERE COALESCE(CASE when SRC.cdctype='D' then 'Y' else 'N' end)  <> COALESCE(TRGT.soft_deleted_flag,'')
