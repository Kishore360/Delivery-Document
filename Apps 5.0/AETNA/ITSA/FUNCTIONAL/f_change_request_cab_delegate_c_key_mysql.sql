SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM aetna_mdsdb.change_request_final SRC 
 LEFT JOIN aetna_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aetna_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',cab_delegate)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
 WHERE TRGT.cab_delegate_c_key <> COALESCE(LKP.row_key,CASE WHEN SRC.cab_delegate IS NULL THEN 0 else -1 end)