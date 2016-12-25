SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.outage_type_src_c_key' ELSE 'SUCCESS' END as Message FROM whirlpool_mdsdb.change_request_final  SRC JOIN whirlpool_mdwdb.f_change_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN whirlpool_mdwdb.d_lov LKP ON ( concat( 'U_OUTAGE_TYPE~CHANGE_REQUEST~~~' ,upper( SRC.u_outage_type)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_outage_type IS NULL THEN 0 else -1 end)<> (TRGT.outage_type_src_c_key) 
