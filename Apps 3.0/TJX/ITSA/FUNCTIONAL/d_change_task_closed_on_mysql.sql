SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.closed_on' ELSE 'SUCCESS' END as Message
FROM tjx_mdsdb.change_task_final SRC
 LEFT JOIN tjx_mdwdb.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~TASK' )
 LEFT JOIN tjx_mdwdb.d_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE L.dimension_wh_code='CLOSED' and  convert_tz(COALESCE( SRC.closed_at,SRC.sys_updated_on),'GMT','America/New_York') 
 <> TRGT.closed_on and TRGT.soft_deleted_flag='N'
