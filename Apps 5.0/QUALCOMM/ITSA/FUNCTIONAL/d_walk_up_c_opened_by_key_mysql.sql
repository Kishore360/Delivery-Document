SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_walk_up_call_c.opened_by_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.u_walk_up_call_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_walk_up_call_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN qualcomm_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',opened_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key);