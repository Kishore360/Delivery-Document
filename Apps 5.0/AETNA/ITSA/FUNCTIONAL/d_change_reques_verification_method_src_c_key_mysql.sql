 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.verification_method_src_c_key

' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt from aetna_mdsdb.change_request_final SRC
 LEFT JOIN aetna_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aetna_mdwdb.d_lov LKP 
 ON (coalesce(concat('RESOLUTION_REASON','~','CHANGE_REQUEST~~~',SRC.u_resolution_reason

),'UNSPECIFIED')  =LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_resolution_reason

 IS NULL THEN 0 else -1 end) 
<> (TRGT.resolution_reason_src_c_key


))b;