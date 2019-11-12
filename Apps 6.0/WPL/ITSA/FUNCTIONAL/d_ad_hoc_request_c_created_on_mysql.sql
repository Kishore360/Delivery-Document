SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.created_on' ELSE 'SUCCESS' END as Message
 FROM wpl_mdsdb.u_ad_hoc_request_final  SRC JOIN wpl_mdwdb.d_ad_hoc_request_c TRGT 
 ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE convert_tz(SRC.sys_created_on,'GMT','America/New_York')<> (TRGT.created_on) and SRC.CDCTYPE='X'
