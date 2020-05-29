SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM #MDS_TABLE_SCHEMA.sc_task_final SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id)
left join #DWH_TABLE_SCHEMA.d_lov_map p
on TRGT.state_src_key=p.src_key
WHERE  TIMESTAMPDIFF(second, SRC.opened_at, SRC.closed_at)<>  TRGT.open_to_close_duration
AND dimension_wh_code = 'CLOSED')temp;
