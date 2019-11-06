SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_call.call_type_src_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.new_call_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_call TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN qualcomm_mdwdb.d_lov LKP 
 ON CONCAT('CALL_TYPE~CALL~~~',UPPER(SRC.call_type))=  LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.call_type IS NULL THEN 0 else -1 end)<> (TRGT.call_type_src_key) and SRC.cdctype='X';

