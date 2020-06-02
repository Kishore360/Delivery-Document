



select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.days_until_due_date' ELSE 'SUCCESS' END as Message
 /*
 select
 SRC.due_date,convert_tz(df.lastupdated,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') as con_las,
 df.lastupdated,
 CASE WHEN (SRC.due_date is not null)
and ( SRC.due_date> convert_tz(df.lastupdated,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
 
THEN TIMESTAMPDIFF(DAY, convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),coalesce(SRC.due_date,0) )
	ELSE '' END as expected, coalesce(TRGT.days_until_due_date,'') as actual
*/
FROM  ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on concat('STATE~SC_TASK~',upper(SRC.state) )= LM.src_rowid
and LM.dimension_class='STATE~SC_TASK'
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id
)

where  CASE WHEN LM.dimension_wh_code  <> 'CLOSED' AND (SRC.due_date is not null)
and (SRC.due_date> convert_tz(df.lastupdated,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
 
THEN TIMESTAMPDIFF(DAY, convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),coalesce(SRC.due_date,0) )
	ELSE '' END <> coalesce(TRGT.days_until_due_date,'')
