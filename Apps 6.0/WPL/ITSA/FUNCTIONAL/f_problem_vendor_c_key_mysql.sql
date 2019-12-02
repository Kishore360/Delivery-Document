SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM wpl_mdsdb.problem_final SRC 
 LEFT JOIN wpl_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN wpl_mdwdb.d_internal_organization LKP 
 ON ( COALESCE(CONCAT('SUBSIDIARY~',SRC.u_vendor ),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_vendor IS NULL THEN 0 else -1 end)<> (TRGT.vendor_c_key)
 and SRC.cdctype='X'