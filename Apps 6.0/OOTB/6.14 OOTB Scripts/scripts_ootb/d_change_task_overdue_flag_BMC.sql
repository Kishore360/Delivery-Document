SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.overdue_flag' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC
left join (SELECT * FROM  #DWH_TABLE_SCHEMA.d_change_task where soft_deleted_flag='N') TRGT 
ON (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
ON (concat('STATE~','CHANGE_TASK~',upper(state)) = LM.src_rowid 
and LM.dimension_class='STATE~CHANGE_TASK' 
AND SRC.sourceinstance = LM.source_id )
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from   #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance
 
 ) 
WHERE CASE WHEN LM.dimension_wh_code  IN('CLOSED') and SRC.actual_end_date >  SRC.Scheduled_End_Date
OR (SRC.scheduled_end_date < convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>' , '<<TENANT_SSI_TIME_ZONE>>') and 
LM.dimension_wh_code='CLOSED')
 THEN 'Y' ELSE 'N' END <> TRGT.overdue_flag
 
 
 
