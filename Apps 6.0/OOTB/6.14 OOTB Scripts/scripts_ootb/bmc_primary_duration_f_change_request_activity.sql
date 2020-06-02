SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for f_change_request_activity.primary_duration'  ELSE 'SUCCESS' END as Message
/*select A.change_request_key, A.change_request_key1, A.task_attribute_wh_name, A.dimension_wh_code, A.created_on, A.created_on1, A.lastupdated, A.closed_on, 
A.primary_duration, A.primary_duration1, A.a, A.b, A.c*/
FROM (
SELECT f1.change_request_key, f2.change_request_key1, f1.task_attribute_wh_name, br.dimension_wh_code, f1.created_on, f2.created_on1, dat.lastupdated, d.closed_on, 
timestampdiff( SECOND ,f1.created_on,d.closed_on ) a,
timestampdiff( SECOND ,f1.created_on,dat.lastupdated) b,
timestampdiff( SECOND ,f1.created_on,f2.created_on1 ) c,
f1.primary_duration,
CASE WHEN  f2.created_on1 IS NULL AND br.dimension_wh_code = 'CLOSED' THEN timestampdiff( SECOND ,f1.created_on,d.closed_on )
	 when f2.created_on1 IS NULL AND f1.created_on > dat.lastupdated then 0
     WHEN f2.created_on1 IS NULL AND br.dimension_wh_code <> 'CLOSED' THEN timestampdiff( SECOND ,f1.created_on,dat.lastupdated)
     when f2.created_on1 < f1.created_on then 0
     ELSE  timestampdiff( SECOND ,f1.created_on,f2.created_on1 ) 
 END AS primary_duration1

FROM     ( SELECT * FROM #DWH_TABLE_SCHEMA.f_change_request_activity WHERE task_wh_type = 'change_request' and task_attribute_wh_name = 'state') f1
LEFT JOIN( SELECT f2.change_request_key as change_request_key1, f2.primary_sequence_id as primary_sequence_id1, f2.created_on as created_on1 
FROM #DWH_TABLE_SCHEMA.f_change_request_activity f2 
           WHERE f2.task_wh_type = 'change_request' and f2.task_attribute_wh_name = 'state' )f2
ON f1.change_request_key = f2.change_request_key1 AND f2.primary_sequence_id1 = f1.primary_sequence_id + 1 AND f1.task_wh_type = 'change_request' 
and f1.task_attribute_wh_name = 'state' 
LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request d ON f1.change_request_key = d.row_key
LEFT join #DWH_TABLE_SCHEMA.f_change_request f ON f1.change_request_key = f.change_request_key
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON f.state_src_key = br.src_key AND br.dimension_class = 'state~change_request'
INNER JOIN ( SELECT MAX(lastupdated) as lastupdated, source_id FROM #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id ) dat 
on f1.source_id = dat.source_id
WHERE f1.change_request_key <> -1 and d.soft_deleted_flag = 'N'
)A 
WHERE A.primary_duration <> (case when A.change_request_key = -1 then null when A.primary_duration1 < 0 then 0 else A.primary_duration1 end)