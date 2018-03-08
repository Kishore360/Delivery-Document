SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_task.implementation_method_src_c_key' ELSE 'SUCCESS' END as Message FROM fidelity_mdsdb.change_task_final  SRC 
JOIN fidelity_mdwdb.d_change_task TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN fidelity_mdwdb.d_lov LKP 
 ON LKP.row_id=(COALESCE(CONCAT('IMPLEMENTATION','~','METHOD','~','~','~',UPPER(SRC.u_implementation_method)),'UNSPECIFIED') ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_implementation_method IS NULL THEN 0 else -1 end)<> (TRGT.implementation_method_src_c_key) 
