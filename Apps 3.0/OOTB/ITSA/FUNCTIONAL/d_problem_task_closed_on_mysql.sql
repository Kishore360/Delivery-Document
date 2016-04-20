SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0
 THEN 'MDS to DWH data validation failed for d_problem_task.closed_on' ELSE 'SUCCESS' END as Message  
 FROM <<tenant>>_mdsdb.problem_task_final SRC  
 LEFT JOIN <<tenant>>_mdwdb.d_problem_task TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
LEFT JOIN <<tenant>>_mdwdb.d_problem_task TRGT1  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
  left join <<tenant>>_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 where  lm.dimension_wh_code = 'CLOSED' 
 and convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)<> TRGT1.closed_on 
