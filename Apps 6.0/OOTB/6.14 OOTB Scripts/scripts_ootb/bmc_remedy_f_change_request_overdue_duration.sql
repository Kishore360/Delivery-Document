SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.overdue_duration' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC1 
left join #DWH_TABLE_SCHEMA.d_change_request SRC
on SRC1.infrastructure_change_id=SRC.row_id  
  JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.row_id=TRGT.row_id 
 AND SRC.source_id=TRGT.source_id ) 
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id )  
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM 
ON   TRGT.state_src_key = LM.src_key 
AND  LM.dimension_class =('STATE~CHANGE_REQUEST')                                      
WHERE case when SRC.overdue_flag ='Y' and LM.dimension_wh_code='OPEN' then
		case when (convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')>convert_tz(SRC.due_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) then 
		TIMESTAMPDIFF(SECOND, convert_tz(SRC.due_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) else 0 end
		when SRC.overdue_flag ='Y' and LM.dimension_wh_code='CLOSED' then
		case when (convert_tz(SRC.closed_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')>convert_tz(SRC.due_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) then 
		TIMESTAMPDIFF(SECOND, convert_tz(SRC.due_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), convert_tz(SRC.closed_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) else 0 end
		else 0
        end
 <> COALESCE(TRGT.overdue_duration ,'')
