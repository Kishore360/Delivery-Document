

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.change_task_final SRC
 LEFT JOIN <<tenant>>_mdwdb.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~CHANGE_TASK' )
 LEFT JOIN <<tenant>>_mdwdb.f_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE case when L.dimension_wh_code='CLOSED' THEN
		CASE WHEN SRC.opened_at <= COALESCE( SRC.closed_at,SRC.sys_updated_on) then COALESCE( TIMESTAMPDIFF(SECOND, SRC.opened_at, 
			COALESCE( SRC.closed_at,SRC.sys_updated_on)) ,'') else '' end
	  else '' end
<> COALESCE(TRGT.open_to_close_duration ,'')