SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.changed_on' ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdsdb.u_ad_hoc_request_final  SRC 
JOIN whirlpool_mdwdb.d_ad_hoc_request_c TRGT ON 
(SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
 WHERE convert_tz(SRC.sys_updated_on,'GMT','America/New_York')<> (TRGT.changed_on) and SRC.CDCTYPE<>'D'
