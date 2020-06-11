SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.closed_on' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC
left join (SELECT * FROM  #DWH_TABLE_SCHEMA.d_change_task where soft_deleted_flag='N') TRGT 
ON (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id)
left join #DWH_TABLE_SCHEMA.d_lov_map LKP
on LKP.src_key=TRGT.state_src_key 
WHERE CASE WHEN LKP.dimension_wh_code ='CLOSED' then substr(CONVERT_TZ(SRC.actual_end_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),1,19) 
else null  end <> COALESCE(TRGT.closed_on,'')
