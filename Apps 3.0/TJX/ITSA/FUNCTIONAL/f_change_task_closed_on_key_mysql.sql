

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM tjx_mdsdb.change_task_final SRC
 LEFT JOIN tjx_mdwdb.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~CHANGE_TASK' )
 LEFT JOIN tjx_mdwdb.f_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN tjx_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(COALESCE( SRC.closed_at,SRC.sys_updated_on),'GMT','America/New_York'),'%Y%m%d') 
	and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN closed_at is null THEN  0 ELSE -1 END )
<> (TRGT.closed_on_key)

