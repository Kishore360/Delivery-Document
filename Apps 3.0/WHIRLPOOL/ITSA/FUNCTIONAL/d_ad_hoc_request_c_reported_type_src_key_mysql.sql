SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.reported_type_src_key' ELSE 'SUCCESS' END as Message FROM whirlpool_mdsdb.u_ad_hoc_request_final  SRC JOIN whirlpool_mdwdb.d_ad_hoc_request_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN whirlpool_mdwdb.d_lov LKP ON ( concat( 'CONTACT_TYPE~U_AD_HOC_REQUEST~~~' ,upper( SRC.contact_type)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contact_type IS NULL THEN 0 else -1 end)<> (TRGT.reported_type_src_key) 