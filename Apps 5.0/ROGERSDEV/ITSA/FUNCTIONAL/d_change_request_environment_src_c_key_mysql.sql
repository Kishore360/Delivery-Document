SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.environment_src_c_key' ELSE 'SUCCESS' END as Message FROM <<tenant>>_mdsdb.change_request_final  SRC JOIN <<tenant>>_mdwdb.d_change_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN <<tenant>>_mdwdb.d_lov LKP ON ( concat( 'ENVIRONMENT~INCIDENT~~~' ,upper( SRC.u_environment)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_environment IS NULL THEN 0 else -1 end)<> (TRGT.environment_src_c_key) 
