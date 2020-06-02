SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.priority_src_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC
left join (SELECT * FROM  #DWH_TABLE_SCHEMA.d_change_task where soft_deleted_flag='N') TRGT 
ON (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON (concat('PRIORITY~','CHANGE_TASK~',upper(priority)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.priority_src_key ,'') 
 
 