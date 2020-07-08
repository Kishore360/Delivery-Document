SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_c_key' ELSE 'SUCCESS' END as Message
FROM truist_mdsdb.change_request_final SRC 
 LEFT JOIN truist_mdwdb.d_change_request TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN truist_mdwdb.d_lov LKP 
 ON  (LKP.dimension_class =  'STATUS_C~CHANGE_REQUEST' and COALESCE(CONCAT('STATUS_C~CHANGE_REQUEST~~~',SRC.state),'UNSPECIFIED')= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.change_request_status_c_key);
 