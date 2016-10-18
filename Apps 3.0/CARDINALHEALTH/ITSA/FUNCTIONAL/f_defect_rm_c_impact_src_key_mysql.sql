 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_defect_rm_c.impact_src_key' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.rm_defect_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_defect_rm_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP
 on (CONCAT('IMPACT','~','TASK','~','~','~',UPPER(SRC.impact)) = LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<> TRGT.impact_src_key