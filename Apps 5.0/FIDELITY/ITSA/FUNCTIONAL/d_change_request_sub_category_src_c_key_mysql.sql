SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.sub_category_src_c_key' ELSE 'SUCCESS' END as Message FROM fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.d_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN fidelity_mdwdb.d_lov LKP 
 ON LKP.row_id=(COALESCE(CONCAT('SUB_CATEGORY','~','CHANGE_REQUEST','~','~','~',UPPER(SRC.u_sub_category)),'UNSPECIFIED') ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_sub_category IS NULL THEN 0 else -1 end)<> (TRGT.sub_category_src_c_key) 
