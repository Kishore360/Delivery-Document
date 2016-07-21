

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.requested_for_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',requested_for) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.requested_for IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.requested_for_key ,'')