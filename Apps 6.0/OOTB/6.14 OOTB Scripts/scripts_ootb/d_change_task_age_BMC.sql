select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.age' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC 
 LEFT JOIN  #DWH_TABLE_SCHEMA.d_change_task TRGT 
 ON (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_task LKP
 on TRGT.row_id=LKP.row_id
left join  #DWH_TABLE_SCHEMA.d_lov_map lm 
  ON (lm.src_key = LKP.state_src_key)
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from   #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
 ON (TRGT.source_id = df.source_id )
where lm.dimension_class = 'STATE~TASK'
and case when lm.dimension_wh_code in ('OPEN') 
    then TIMESTAMPDIFF(day, coalesce( SRC.create_date,0),convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
    else case when SRC.create_date> SRC.scheduled_end_date then 0 else 
    TIMESTAMPDIFF(day,coalesce( SRC.create_date,0),coalesce( SRC.scheduled_end_date,0)) end
    end <>coalesce(TRGT.age,'')
