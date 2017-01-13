SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.caller_key' ELSE 'SUCCESS' END as Message FROM whirlpool_mdsdb.u_ad_hoc_request_final  SRC JOIN whirlpool_mdwdb.f_ad_hoc_request_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN whirlpool_mdwdb.d_internal_contact LKP ON ( concat( 'INTERNAL_CONTACT~' ,upper( SRC.u_caller)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_caller IS NULL THEN 0 else -1 end)<> (TRGT.caller_key) 
