SELECT 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message  
 FROM 
 (
 select count(1) as cnt from aetna_mdsdb.change_request_final SRC
 LEFT JOIN aetna_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN aetna_mdwdb.d_lov LKP
 ON (COALESCE(CONCAT('CLOSE_CODE','~','CHANGE_REQUEST','~','~','~',UPPER(SRC.close_code)),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE TRGT.soft_deleted_flag='N'
 AND COALESCE(LKP.row_key,CASE WHEN SRC.close_code  IS NULL THEN 0 else -1 end)<> (TRGT.close_code_src_key
 )
 )b;

