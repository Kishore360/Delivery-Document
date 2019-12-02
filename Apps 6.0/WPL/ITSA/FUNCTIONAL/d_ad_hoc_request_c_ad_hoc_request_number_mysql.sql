SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.ad_hoc_request_number' ELSE 'SUCCESS' END as Message
 FROM wpl_mdsdb.u_ad_hoc_request_final  SRC JOIN wpl_mdwdb.d_ad_hoc_request_c TRGT 
 ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.number <> (TRGT.ad_hoc_request_number) 
 and SRC.CDCTYPE='X'
 
