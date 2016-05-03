 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.reported_type_src_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.change_request_final SRC
 LEFT JOIN molinahealth_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN molinahealth_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',UPPER(u_approved_by))= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_approved_by IS NULL THEN 0 else -1 end)<> (TRGT.approved_by_c_key)
 
 