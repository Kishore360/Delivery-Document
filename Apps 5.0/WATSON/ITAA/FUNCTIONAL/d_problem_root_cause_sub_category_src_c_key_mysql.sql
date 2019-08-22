
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.root_cause_sub_category_src_c_key' ELSE 'SUCCESS' END as Message
 FROM watson_mdsdb.problem_final SRC 
 LEFT JOIN  watson_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN watson_mdwdb.d_lov LKP 
 ON ( concat('U_ROOT_CAUSE_SUB_CATEGORY','~','PROBLEM','~','~','~',upper(u_root_cause_sub_category))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_root_cause_sub_category IS NULL THEN 0 else -1 end) <> (TRGT.root_cause_sub_category_src_c_key)
 
