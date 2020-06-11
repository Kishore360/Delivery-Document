SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task.age' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_task TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_task TRGTD
ON TRGTD.row_key = TRGT.task_key

LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map lm 
ON (lm.src_key = TRGTD.state_src_key and lm.dimension_class = 'STATE~TASK')
LEFT JOIN (
select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
) df 
ON (TRGT.source_id = df.source_id)

where case when (lm.dimension_wh_code = 'OPEN')  OR (lm.dimension_wh_code ='CLOSED' AND SRC.closed_at is NULL ) then 
                                case when coalesce(SRC.opened_at,0)> convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') then 0 
                                    else TIMESTAMPDIFF(DAY, coalesce( SRC.opened_at,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) end
                else 
                                case when  SRC.opened_at>coalesce(SRC.closed_at,0) then 0 
                                     else TIMESTAMPDIFF(DAY,coalesce( SRC.opened_at,0),coalesce(SRC.closed_at,0))
                                end 
end<>coalesce( TRGT.age,'')
