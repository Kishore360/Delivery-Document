SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for f_problem_activity.primary_duration'  ELSE 'SUCCESS' END as Message
FROM (
SELECT f1.row_key,f1.row_id,f1.problem_key ,f2.problem_key1, f1.primary_sequence_id,f2.primary_sequence_id1,f1.created_on, f2.created_on1,dat.lastupdated,d.closed_on,
br.dimension_wh_code,f1.task_attribute_wh_new_value, f1.task_wh_type,f1.task_attribute_wh_name,f1.primary_duration,
CASE WHEN  f2.created_on1 IS NULL AND br.dimension_wh_code = 'CLOSED' THEN timestampdiff( SECOND ,convert_tz(f1.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(d.closed_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') )
     WHEN  f2.created_on1 IS NULL AND br.dimension_wh_code != 'CLOSED' THEN timestampdiff( SECOND ,convert_tz(f1.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') )
     ELSE  timestampdiff( SECOND ,convert_tz(f1.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(f2.created_on1,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') ) 
 END AS primary_duration1 , f1.etl_run_number
FROM     ( SELECT * FROM #DWH_TABLE_SCHEMA.f_problem_activity WHERE task_wh_type = 'problem' and task_attribute_wh_name = 'problem_state') f1
LEFT JOIN( SELECT f2.problem_key as problem_key1, f2.primary_sequence_id as primary_sequence_id1, f2.created_on as created_on1 FROM #DWH_TABLE_SCHEMA.f_problem_activity f2 
           WHERE f2.task_wh_type = 'problem' and f2.task_attribute_wh_name = 'problem_state' )f2
ON f1.problem_key = f2.problem_key1 AND f2.primary_sequence_id1 = f1.primary_sequence_id + 1 AND f1.task_wh_type = 'problem' and f1.task_attribute_wh_name = 'problem_state' 
INNER JOIN #DWH_TABLE_SCHEMA.d_problem d ON f1.problem_key = d.row_key and d.soft_deleted_flag = 'N'
join #DWH_TABLE_SCHEMA.f_problem F on F.problem_key = d.row_key
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON F.state_src_key = br.src_key AND br.dimension_class = 'STATE~PROBLEM'
INNER JOIN ( SELECT MAX(lastupdated) as lastupdated, source_id FROM #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id ) dat on f1.source_id = dat.source_id
ORDER BY f1.problem_key,f1.primary_sequence_id
)A 
WHERE A.primary_duration <> (case when A.problem_key = -1 then null when A.primary_duration1 < 0 then 0 else A.primary_duration1 end)