SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.problem_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CASE WHEN SRC.knowledge = 1 THEN 'Y' ELSE 'N' END <> TRGT.knowledge_flag
 and SRC.cdctype='X'
