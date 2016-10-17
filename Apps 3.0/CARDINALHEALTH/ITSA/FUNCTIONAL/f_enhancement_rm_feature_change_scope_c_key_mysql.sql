SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS TO MDW DATA VALIDATION FAILED' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.rm_enhancement_final SRC
 LEFT JOIN cardinalhealth_mdwdb.f_enhancement_rm TRGT
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP
on (LKP.src_rowid = CONCAT('CHANGE_SCOPE_C~RM_FEATURE~~~',UPPER(SRC.u_change_scope))
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_change_scope IS NULL THEN 0 else -1 end)<> (TRGT.feature_change_scope_c_key)