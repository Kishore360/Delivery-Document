SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for f_request_activity.primary_sequence_id'  ELSE 'SUCCESS' END as Message
FROM (
SELECT f1.row_key,f1.row_id,f1.task_key ,f2.task_key1, f1.primary_sequence_id,f2.primary_sequence_id1,f1.created_on, f2.created_on1,dat.lastupdated,d.closed_on,
br.dimension_wh_code,f1.task_attribute_wh_new_value, f1.task_wh_type,f1.task_attribute_wh_name,f1.primary_duration,
CASE WHEN  f2.created_on1 IS NULL AND br.dimension_wh_code = 'CLOSED' THEN timestampdiff( SECOND ,f1.created_on,d.closed_on )
     WHEN  f2.created_on1 IS NULL AND br.dimension_wh_code != 'CLOSED' THEN timestampdiff( SECOND ,f1.created_on,dat.lastupdated )
     ELSE  timestampdiff( SECOND ,f1.created_on,f2.created_on1 ) 
 END AS primary_duration1 , f1.etl_run_number
FROM     ( SELECT 1 FROM <<tenant>>_mdwdb.f_request_activity WHERE task_wh_type = 'sc_request' and task_attribute_wh_name = 'request_state') f1
LEFT JOIN( SELECT f2.task_key as task_key1, f2.primary_sequence_id as primary_sequence_id1, f2.created_on as created_on1 FROM <<tenant>>_mdwdb.f_request_activity f2 
           WHERE f2.task_wh_type = 'sc_request' and f2.task_attribute_wh_name = 'request_state' )f2
ON f1.task_key = f2.task_key1 AND f2.primary_sequence_id1 = f1.primary_sequence_id + 1 AND f1.task_wh_type = 'sc_request' and f1.task_attribute_wh_name = 'request_state' 
INNER JOIN <<tenant>>_mdwdb.d_request d ON f1.task_key = d.row_key
LEFT JOIN <<tenant>>_mdwdb.d_lov_map br ON f1.task_attribute_wh_new_value = br.dimension_code AND br.dimension_class = 'request_state~sc_request'
INNER JOIN ( SELECT MAX(lastupdated) as lastupdated, source_id FROM <<tenant>>_mdwdb.d_o_data_freshness group by source_id ) dat on f1.source_id = dat.source_id
ORDER BY f1.task_key,f1.primary_sequence_id
)A 
WHERE A.primary_duration <> A.primary_duration1 OR A.primary_duration is null
