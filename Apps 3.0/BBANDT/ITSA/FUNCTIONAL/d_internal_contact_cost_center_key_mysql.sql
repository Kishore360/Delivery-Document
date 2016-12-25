SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_cost_center_c_key' ELSE 'SUCCESS' END as Message
FROM bbandt_mdsdb.sys_user_final SRC 
LEFT JOIN bbandt_mdwdb.d_cost_center LKP
ON ( (CONCAT('INTERNAL_CONTACT~',SRC.sys_id))= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
LEFT JOIN bbandt_mdwdb.d_internal_contact TRGT 
ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cost_center IS NULL THEN 0 else -1 end)<> 
(TRGT.cost_center_key); 




