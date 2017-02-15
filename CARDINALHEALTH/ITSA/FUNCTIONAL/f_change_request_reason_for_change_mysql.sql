SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.reason_for_change_src_c_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.change_request_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON ( CONCAT('REASON_FOR_CHANGE_C','~','CHANGE_REQUEST','~','~','~',UPPER(u_reason_for_change ))= LKP.row_id )
 LEFT JOIN cardinalhealth_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN u_reason_for_change IS NULL THEN 0 else -1 end)<> (TRGT.reason_for_change_src_c_key))temp;
 
