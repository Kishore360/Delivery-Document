SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.changed_on'
 ELSE 'SUCCESS' END as Message 
 FROM aon_mdsdb.u_ad_hoc_request_final  SRC 
 JOIN aon_mdwdb.d_ad_hoc_request_c TRGT 
 ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE convert_tz(SRC.sys_updated_on,'GMT','US/Central')<> (TRGT.changed_on) 
