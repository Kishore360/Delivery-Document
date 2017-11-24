SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.swat_code_src_c_key' ELSE 'SUCCESS' END as Message FROM rogersdev_mdsdb.problem_final  SRC JOIN rogersdev_mdwdb.d_problem TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN rogersdev_mdwdb.d_lov LKP ON ( concat( 'SWAT_CODE~PROBLEM~~~' ,upper( SRC.u_swat_code)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_swat_code IS NULL THEN 0 else -1 end)<> (TRGT.swat_code_src_c_key) 
