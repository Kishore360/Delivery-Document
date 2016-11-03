
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.category_src_key' ELSE 'SUCCESS' END as Message
 FROM tivo_mdsdb.problem_final SRC 
 LEFT JOIN tivo_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN tivo_mdwdb.d_lov LKP 
 ON ( concat('CATEGORY_C~PROBLEM~~~',upper(u_category))= LKP.row_id 
)
 WHERE COALESCE(LKP.row_key,CASE WHEN u_category IS NULL THEN 0 else -1 end)<>(TRGT.category_src_key)