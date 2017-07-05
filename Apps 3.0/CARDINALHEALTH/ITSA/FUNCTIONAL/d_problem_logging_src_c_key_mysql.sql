 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.logging_src_c_key' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.problem_final SRC 
 LEFT JOIN  cardinalhealth_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON ( concat('LOGGING_C~PROBLEM','~','~','~',upper(u_is_logging))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_is_logging IS NULL THEN 0 else -1 end) <> (TRGT.logging_src_c_key)
 