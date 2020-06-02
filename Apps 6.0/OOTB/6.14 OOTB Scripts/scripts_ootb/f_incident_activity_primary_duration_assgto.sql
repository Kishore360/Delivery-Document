SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for f_incident_activity.primary_duration'  ELSE 'SUCCESS' END as Message
FROM (
SELECT f1.row_key,f1.row_id,f1.incident_key ,f2.incident_key1, f1.primary_sequence_id,f2.primary_sequence_id1,f1.created_on, f2.created_on1,
dat.lastupdated,d.closed_on,
br.dimension_wh_code,f1.task_attribute_wh_new_value, f1.task_wh_type,f1.task_attribute_wh_name,f1.primary_duration,
CASE WHEN  f2.created_on1 IS NULL AND br.dimension_wh_code = 'CLOSED' THEN timestampdiff( SECOND ,convert_tz(f1.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(d.closed_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') )
     WHEN  f2.created_on1 IS NULL AND br.dimension_wh_code != 'CLOSED' THEN timestampdiff( SECOND ,convert_tz(f1.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') )
     ELSE  timestampdiff( SECOND ,convert_tz(f1.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(f2.created_on1,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') ) 
 END AS primary_duration1, f1.etl_run_number
FROM     ( SELECT * FROM #DWH_TABLE_SCHEMA.f_incident_activity WHERE task_wh_type = 'incident' and task_attribute_wh_name = 'assigned_to') f1
LEFT JOIN( SELECT f2.incident_key as incident_key1, f2.primary_sequence_id as primary_sequence_id1, f2.created_on as created_on1 
FROM #DWH_TABLE_SCHEMA.f_incident_activity f2 
           WHERE f2.task_wh_type = 'incident' and f2.task_attribute_wh_name = 'assigned_to' )f2
ON f1.incident_key = f2.incident_key1 AND f2.primary_sequence_id1 = f1.primary_sequence_id + 1 AND f1.task_wh_type = 'incident' 
and f1.task_attribute_wh_name = 'assigned_to' 
INNER JOIN #DWH_TABLE_SCHEMA.d_request d ON f1.incident_key = d.row_key
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON f1.task_attribute_wh_new_value = br.dimension_code AND br.dimension_class = 'state~incident'
INNER JOIN ( SELECT MAX(lastupdated) as lastupdated, source_id FROM #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id ) dat 
on f1.source_id = dat.source_id
WHERE f1.incident_key <> -1 and d.soft_deleted_flag = 'N'
ORDER BY f1.incident_key,f1.primary_sequence_id
)A 
WHERE A.primary_duration <> (case when A.primary_duration1 < 0 then 0 else A.primary_duration1 end) OR A.primary_duration is null