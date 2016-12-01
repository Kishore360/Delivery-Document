SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM rei_mdsdb.sc_task_final SRC
 LEFT JOIN rei_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN rei_mdwdb.d_lov_map MAP ON MAP.SRC_KEY=TRGT.STATE_SRC_KEY
WHERE  TIMESTAMPDIFF(second, SRC.opened_at, SRC.closed_at)<>  TRGT.open_to_close_duration
AND dimension_wh_code = 'CLOSED'