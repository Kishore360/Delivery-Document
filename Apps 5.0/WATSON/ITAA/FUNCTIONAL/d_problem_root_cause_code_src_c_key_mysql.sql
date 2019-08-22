
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.root_cause_code_src_c_key' ELSE 'SUCCESS' END as Message
 FROM watson_mdsdb.problem_final SRC 
 LEFT JOIN  watson_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN watson_mdwdb.d_lov LKP 
 ON ( concat('ROOT_CAUSE_CODES_C','~','PROBLEM','~','~','~',upper(u_root_cause_codes))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_root_cause_codes IS NULL THEN 0 else -1 end) <> (TRGT.root_cause_codes_src_c_key)
 
 
 