

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.sub_category_src_key' ELSE 'SUCCESS' END as Message
 FROM mercury_mdsdb.problem_task_final SRC 
 LEFT JOIN mercury_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN mercury_mdwdb.d_lov LKP 
 ON ( concat('SUBCATEGORY~problem_task~',upper(subcategory))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.subcategory IS NULL THEN 0 else -1 end)<> (TRGT.sub_category_src_key) and SRC.CDCTYPE<>'D'
