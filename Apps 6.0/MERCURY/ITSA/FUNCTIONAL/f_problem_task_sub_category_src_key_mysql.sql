

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.sub_category_src_key' ELSE 'SUCCESS' END as Message
 FROM  mercury_mdsdb.us_f_problem_task_final SRC 
 LEFT JOIN mercury_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) and SRC.CDCTYPE<>'D'
LEFT JOIN mercury_mdwdb.d_lov LKP 
 ON ( concat('SUBCATEGORY~problem_task~',upper(sub_category_src_code))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sub_category_src_code IS NULL THEN 0 else -1 end)<> (TRGT.sub_category_src_key) 