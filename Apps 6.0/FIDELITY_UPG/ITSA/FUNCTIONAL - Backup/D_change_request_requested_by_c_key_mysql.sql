SELECT 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_change_request.requested_by_key' ELSE 'SUCCESS' END as Message  
 FROM 
 (
 select count(1) as cnt from fidelity_mdsdb.change_request_final SRC
 LEFT JOIN fidelity_workdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN fidelity_workdb.d_internal_contact LKP
 ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',
                SRC.requested_by),
                'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE TRGT.soft_deleted_flag='N'
 AND COALESCE(LKP.row_key,CASE WHEN SRC.requested_by  IS NULL THEN 0 else -1 end)<> (TRGT.requested_by_c_key
 )
 )b;