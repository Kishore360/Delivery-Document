SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.change_request_key' ELSE 'SUCCESS' END as Message FROM wpl_mdsdb.u_ad_hoc_request_final  SRC JOIN wpl_mdwdb.f_ad_hoc_request_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN wpl_mdwdb.d_change_request LKP ON ( concat( '' ,upper( SRC.u_change_request)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_change_request IS NULL THEN 0 else -1 end)<> (TRGT.change_request_key) and SRC.cdctype='X'
