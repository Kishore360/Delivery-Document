

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM tjx_mdsdb.change_task_final SRC
 LEFT JOIN tjx_mdwdb.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~CHANGE_TASK' )
 LEFT JOIN tjx_mdwdb.f_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE dimension_wh_code='CLOSED' and  COALESCE( TIMESTAMPDIFF(SECOND, SRC.opened_at, COALESCE( SRC.closed_at,SRC.sys_updated_on)) ) 
	  <> COALESCE(TRGT.open_to_close_duration ,'')