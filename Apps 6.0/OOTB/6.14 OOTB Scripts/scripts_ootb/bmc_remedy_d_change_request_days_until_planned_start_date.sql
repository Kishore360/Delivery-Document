SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.row_id' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id
 -- AND TRGT.etl_run_number = df.etl_run_number
 )


where  CASE WHEN (SRC.scheduled_start_date is not null)
and (SRC.scheduled_start_date> convert_tz(df.lastupdated,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
 
THEN TIMESTAMPDIFF(DAY, convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),coalesce(SRC.scheduled_start_date,0) )
	ELSE '' END <> coalesce(TRGT.days_until_planned_start_date,'')
