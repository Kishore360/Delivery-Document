SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_fmr_product_c.architect_c_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.u_fmr_product_final  SRC 
JOIN fidelity_mdwdb.d_fmr_product_c TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN fidelity_mdwdb.d_internal_contact LKP
 ON ( concat( 'INTERNAL_CONTACT~' ,upper( SRC.u_architect)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_architect IS NULL THEN 0 else -1 end)<> (TRGT.architect_c_key)  and SRC.cdctype<>'D' 
