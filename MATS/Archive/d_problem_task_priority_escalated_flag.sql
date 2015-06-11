

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.priority_escalated_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.problem_task_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_problem_task TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_t_task_activity TA 
 ON (convert(SRC.sys_id using utf8) =convert(TA.task_row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 AND TA.task_wh_type = 'problem_task' 
AND TA.task_attribute_wh_name =  'priority' 
 WHERE CONVERT( CASE WHEN TA.task_attribute_wh_old_value IS NOT NULL AND TA.task_attribute_wh_new_value IS NOT NULL   
AND  TA.task_attribute_wh_new_value < TA.task_attribute_wh_old_value 
THEN 'Y' ELSE 'N' END
using utf8)<> COALESCE(CONVERT(TRGT.priority_escalated_flag using utf8),'')
