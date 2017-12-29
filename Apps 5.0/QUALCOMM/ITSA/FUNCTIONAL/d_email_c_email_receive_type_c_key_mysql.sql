SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_email_c.email_receive_type_c_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sys_email_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_email_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN qualcomm_mdwdb.d_lov LKP 
 ON COALESCE( CONCAT('RECEIVE_TYPE','~','SYS_EMAIL','~','~','~',(SRC.receive_type)),'UNSPECIFIED')=  LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.receive_type IS NULL THEN 0 else -1 end)<> (TRGT.email_receive_type_c_key);

