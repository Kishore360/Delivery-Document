SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.requested_by_key' 
ELSE 'SUCCESS' END as Message 
FROM aon_mdsdb.u_ad_hoc_request_final  SRC 
JOIN aon_mdwdb.f_ad_hoc_request_c TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN aon_mdwdb.d_internal_contact LKP 
ON ( concat( 'INTERNAL_CONTACT~' ,upper( SRC.u_requested_by)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_requested_by IS NULL THEN 0 else -1 end)<> (TRGT.requested_by_key) 
