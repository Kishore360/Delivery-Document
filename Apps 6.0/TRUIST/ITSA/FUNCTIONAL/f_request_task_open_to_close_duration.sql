 

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM truist_mdsdb.sc_task_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN truist_mdwdb.d_lov_map L
 ON (concat('STATE~SC_TASK~',upper(SRC.state))=L.src_rowid
 AND SRC.sourceinstance=L.source_id)
 LEFT JOIN truist_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE case when L.dimension_wh_code='CLOSED' THEN
		CASE WHEN SRC.opened_at <= COALESCE( SRC.closed_at,SRC.sys_updated_on) then COALESCE( TIMESTAMPDIFF(SECOND, SRC.opened_at, 
			COALESCE( SRC.closed_at,SRC.sys_updated_on)) ,'') else '' end
	  else '' end
<> COALESCE(TRGT.open_to_close_duration ,'')  