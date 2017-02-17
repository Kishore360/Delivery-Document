SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.rm_enhancement_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_enhancement_rm_c LKP
 on LKP.row_id = SRC.sys_id and LKP.source_id  = SRC.sourceinstance
 LEFT JOIN cardinalhealth_mdwdb.f_enhancement_rm TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE LKP.row_key <> TRGT.enhancement_c_key)temp;
 