SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.business_duration' ELSE 'SUCCESS' END as Message FROM wpl_mdsdb.u_ad_hoc_request_final  SRC JOIN wpl_mdwdb.f_ad_hoc_request_c TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE CASE WHEN SRC.business_duration is null  THEN NULL 
     WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.business_duration) < 0 
	 THEN NULL ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.business_duration) end<> (TRGT.business_duration) 
	 and SRC.cdctype='X'
