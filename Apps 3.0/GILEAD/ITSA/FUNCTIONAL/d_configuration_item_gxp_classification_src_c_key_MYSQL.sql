
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM gilead_mdsdb.cmdb_ci_final SRC 
 LEFT JOIN gilead_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN gilead_mdwdb.d_lov LKP 
 ON COALESCE(CONCAT('U_GXP_C~CONFIGURATION_ITEM','~~~',UPPER(SRC.u_gxp)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_gxp IS NULL THEN 0 else -1 end)<> (TRGT.gxp_classification_src_c_key))temp;