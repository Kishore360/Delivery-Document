SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_c.kb_article_c_key' ELSE 'SUCCESS' END as Message
  FROM nypres_mdsdb.problem_final SRC 
Add a comment to this line
  LEFT JOIN nypres_mdwdb.f_problem TRGT 
  ON (SRC.sys_id =TRGT.row_id  
  AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN nypres_mdwdb.d_kb_knowledge_c LKP 
  ON  (u_kb_article)= LKP.row_id 
  WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_kb_article IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.kb_article_c_key)]
  
  