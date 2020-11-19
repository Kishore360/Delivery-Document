SELECT 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_task.validation_method_c_key' ELSE 'SUCCESS' END as Message  
 FROM 
 (
 select count(1) as cnt from fidelity_mdsdb.change_task_final SRC
 LEFT JOIN fidelity_mdwdb.d_change_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN fidelity_mdwdb.d_lov LKP
 ON (COALESCE(CONCAT('U_VALIDATION_METHOD~CHANGE_TASK~',UPPER(SRC.u_validation_method)),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE TRGT.soft_deleted_flag='N'
 AND COALESCE(LKP.row_key,CASE WHEN SRC.u_validation_method  IS NULL THEN 0 else -1 end)<> (TRGT.validation_method_c_key
 ) and SRC.cdctype<>'D'
 )b;