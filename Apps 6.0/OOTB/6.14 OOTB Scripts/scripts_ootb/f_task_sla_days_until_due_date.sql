



select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_sla.days_until_due_date ' ELSE 'SUCCESS' END as Message
 FROM   ( SELECT * FROM #MDS_TABLE_SCHEMA.task_sla_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN  #DWH_TABLE_SCHEMA.f_task_sla TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
   
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id
 -- AND TRGT.etl_run_number = df.etl_run_number
 )


where  CASE WHEN (SRC.planned_end_time  is not null)
and (SRC.planned_end_time > convert_tz(df.lastupdated,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
 
THEN TIMESTAMPDIFF(DAY, convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),coalesce(SRC.planned_end_time ,0) )
	ELSE '' END <> coalesce(TRGT.days_until_due_date ,'')
