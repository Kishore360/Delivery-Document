SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM <<tenant>>_mdsdb.problem_task_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
   LEFT JOIN <<tenant>>_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
WHERE  TIMESTAMPDIFF(second, opened_at, coalesce(SRC.closed_at,SRC.sys_updated_on))<>  (TRGT.open_to_close_duration))temp;

