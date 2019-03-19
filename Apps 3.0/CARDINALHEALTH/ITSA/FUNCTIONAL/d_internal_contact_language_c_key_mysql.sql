SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.sys_user_final SRC 
  JOIN cardinalhealth_mdwdb.d_internal_contact TRGT 
 ON (SRC.sys_id =RIGHT(TRGT.row_id, 32)  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON ( COALESCE(CONCAT('PREFERRED_LANGUAGE_C~SYS_USER~~~',SRC.preferred_language),'PREFERRED_LANGUAGE_C~SYS_USER~~~en'))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE TRGT .soft_deleted_flag='N' and LKP.soft_deleted_flag='N' and  COALESCE(LKP.row_key,CASE WHEN SRC.preferred_language IS NULL THEN 0 else -1 end)<> (TRGT.language_c_key))temp;
 