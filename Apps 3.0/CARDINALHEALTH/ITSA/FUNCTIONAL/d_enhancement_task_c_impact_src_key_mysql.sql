SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_enhancement_rm.impact_src_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.u_enhancement_task_final SRC 
  JOIN  cardinalhealth_mdwdb.d_enhancement_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN cardinalhealth_mdwdb.d_lov LKP
 ON COALESCE(CONCAT('IMPACT_C','~','ENHANCEMENT_TASK','~','~','~',UPPER(SRC.impact)),'UNSPECIFIED') = LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end) <> TRGT.impact_src_key)temp;
 
 
 