SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.problem_vendor_c_key' ELSE 'SUCCESS' END as Message FROM discover_mdsdb.problem_final  SRC JOIN discover_mdwdb.d_problem TRGT
 ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN discover_mdwdb.d_internal_organization LKP ON ( concat( 'SUBSIDIARY~' ,upper( SRC.company)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.problem_vendor_c_key) and SRC.cdctype='X'
