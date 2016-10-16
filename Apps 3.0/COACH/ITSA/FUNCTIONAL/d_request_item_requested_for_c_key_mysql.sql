SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.u_requested_for' ELSE 'SUCCESS' END as Message 
FROM coach_mdsdb.sc_req_item_final  SRC 
JOIN coach_mdwdb.d_request_item TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN coach_mdwdb.d_internal_contact LKP  ON ( concat( 'INTERNAL_CONTACT~' , SRC.u_requested_for) = LKP.row_id  AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_requested_for IS NULL THEN 0 else -1 end)<> (TRGT.requested_for_c_key) ;
