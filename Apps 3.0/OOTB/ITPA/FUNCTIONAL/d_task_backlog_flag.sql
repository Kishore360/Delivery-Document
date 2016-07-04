SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM
 on TRGT.state_src_key = LM.src_key 
 and LM.dimension_class = 'STATE~TASK'
WHERE COALESCE( CASE WHEN LM.dimension_wh_code  IN('OPEN') THEN 'Y' ELSE 'N' END ,'')<> COALESCE(TRGT.backlog_flag ,'')

