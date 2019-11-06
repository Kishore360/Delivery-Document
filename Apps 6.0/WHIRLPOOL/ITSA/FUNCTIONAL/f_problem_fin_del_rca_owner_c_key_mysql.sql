SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.problem_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN whirlpool_mdwdb.d_internal_contact LKP 
 ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_fin_del_rca_owner ),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_fin_del_rca_owner IS NULL THEN 0 else -1 end)<> (TRGT.fin_del_rca_owner_c_key)
<<<<<<< HEAD
and SRC.CDCTYPE='X'
=======
 and SRC.cdctype='X'
>>>>>>> 9090f642d78b2876f16aceb3bf589190f5fc5da4
