SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.dormancy_age' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC
left join (SELECT * FROM  #DWH_TABLE_SCHEMA.f_change_task where soft_deleted_flag='N') TRGT 
ON (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id)
 left join #DWH_TABLE_SCHEMA.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
    
  
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id
  )
where lm.dimension_class = 'STATE~CHANGE_TASK'

AND  CASE WHEN lm.dimension_wh_code = 'OPEN' 
THEN TIMESTAMPDIFF(SECOND,coalesce(SRC.modified_date,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') )
	ELSE 0 END <> coalesce(TRGT.dormancy_age,'')

