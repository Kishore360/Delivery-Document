

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.category_src_key' ELSE 'SUCCESS' END as Message
 FROM rambus_mdsdb.problem_final SRC 
 LEFT JOIN rambus_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN rambus_mdwdb.d_lov LKP 
 ON ( concat('CATEGORY~INCIDENT~~~',upper(u_application))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN u_application IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.category_src_key,'')
