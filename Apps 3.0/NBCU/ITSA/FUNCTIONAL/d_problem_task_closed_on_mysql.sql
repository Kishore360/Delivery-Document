SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0
 THEN 'MDS to DWH data validation failed for d_problem_task.closed_on' ELSE 'SUCCESS' END as Message  
 FROM nbcu_mdsdb.problem_task_final SRC  
 LEFT JOIN nbcu_mdwdb.d_problem_task TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
join nbcu_mdwdb.f_problem_task lkp
on TRGT.row_key= lkp.problem_task_key and TRGT.source_id =lkp.source_id 
  left join nbcu_mdwdb.d_lov_map lm 
 ON (lm.src_key = lkp.state_src_key)
 where  lm.dimension_wh_code = 'CLOSED' 
 and convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),"GMT","America/New_York")<> TRGT.closed_on 