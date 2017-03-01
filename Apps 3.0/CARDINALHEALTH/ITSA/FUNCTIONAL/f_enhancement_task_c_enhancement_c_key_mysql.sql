SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.u_enhancement_task_final SRC 
 JOIN cardinalhealth_mdwdb.f_enhancement_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN cardinalhealth_mdwdb.d_enhancement_rm_c LKP
 on LKP.row_id=COALESCE(parent,'UNSPECIFIED') and LKP.source_id  = SRC.sourceinstance
 WHERE coalesce(LKP.row_key,case when SRC.parent is null then 0 else -1 end) <> TRGT.enhancement_c_key)temp;
 
 
 
 
 