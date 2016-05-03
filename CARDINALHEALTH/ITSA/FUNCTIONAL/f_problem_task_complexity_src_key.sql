SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.category_src_key' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.problem_task_final SRC 
 left join cardinalhealth_mdsdb.u_complexity_final LKP on LKP.sys_id=SRC.u_complexity
 LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON ( concat('U_COMPLEXITY~PROBLEM~~~',upper(LKP.u_value))= LKP.row_id )
 LEFT JOIN cardinalhealth_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN u_complexity IS NULL THEN 0 else -1 end)<> (TRGT.complexity_src_c_key)
