SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM wpl_mdsdb.problem_task_final SRC 
 LEFT JOIN wpl_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN wpl_mdwdb.d_lov LKP 
 ON (COALESCE(CONCAT('U_ESSENTIAL_TO_FIX',
                '~',
                'PROBLEM_TASK',
                '~',
                UPPER(SRC.u_essential_to_fix)),
                'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_essential_to_fix IS NULL THEN 0 else -1 end)<> (TRGT.problem_task_essential_to_fix_c_key)
 and SRC.cdctype='X'     