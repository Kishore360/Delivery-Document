

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.dormancy_age' ELSE 'SUCCESS' END as Message
 
FROM  ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
    
    left join #DWH_TABLE_SCHEMA.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
    
  
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id
 -- AND TRGT.etl_run_number = df.etl_run_number
 )
where lm.dimension_class = 'STATE~SC_TASK'

AND  CASE WHEN lm.dimension_wh_code = 'OPEN' 
THEN TIMESTAMPDIFF(SECOND,coalesce(SRC.sys_updated_on,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') )
	ELSE 0 END <> coalesce(TRGT.dormancy_age,'')
