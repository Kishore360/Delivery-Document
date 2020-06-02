SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.planned_start_day_of_week' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
LEFT  JOIN (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id )  
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM 
ON   TRGT.change_state_src_key = LM.src_key 
AND  LM.dimension_class =('STATE~CHANGE_REQUEST')                                      
WHERE coalesce(case when SRC.Scheduled_Start_Date is null and LM.dimension_wh_code='OPEN' then '0'
when LM.dimension_wh_code=  'OPEN' then (HOUR(CONVERT_TZ(SRC.Scheduled_Start_Date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'))) end,'')
<> COALESCE(TRGT.planned_start_hour_of_day,'')









