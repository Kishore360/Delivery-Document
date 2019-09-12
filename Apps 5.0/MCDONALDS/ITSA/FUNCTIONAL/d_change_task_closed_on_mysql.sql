SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.closed_on' ELSE 'SUCCESS' END as Message
FROM mcdonalds_mdsdb.change_task_final SRC
 LEFT JOIN mcdonalds_mdwdb.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~TASK' )
 LEFT JOIN mcdonalds_mdwdb.d_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE case when L.dimension_wh_code='CLOSED' then convert_tz(COALESCE( SRC.closed_at,SRC.sys_updated_on),'GMT','America/New_York') 
else '' end
 <> COALESCE(TRGT.closed_on,'')
