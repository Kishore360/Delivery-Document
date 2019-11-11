SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.problem_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN whirlpool_mdwdb.d_configuration_item LKP 
 ON ( COALESCE(SRC.u_fin_sys_srvr_name,'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_fin_sys_srvr_name IS NULL THEN 0 else -1 end)<> (TRGT.fin_sys_srvr_name_c_key)
 and SRC.cdctype='X'