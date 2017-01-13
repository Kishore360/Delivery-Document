SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.created_by' ELSE 'SUCCESS' END as Message FROM whirlpool_mdsdb.u_ad_hoc_request_final  SRC JOIN whirlpool_mdwdb.f_ad_hoc_request_c TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.sys_created_by <> (TRGT.created_by) 
