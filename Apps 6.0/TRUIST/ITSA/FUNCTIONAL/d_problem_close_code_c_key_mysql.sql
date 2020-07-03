SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.close_code_c_key' ELSE 'SUCCESS' END as Message
 FROM (select * from truist_mdsdb.problem_final where cdctype<>'D') SRC 
 LEFT JOIN truist_mdwdb.d_problem TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN truist_mdwdb.d_lov LKP 
 ON  LKP.dimension_class =  'CLOSE_CODE_C~PROBLEM' and (concat('CLOSE_CODE_C~PROBLEM~',upper(SRC.u_close_code))= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_close_code IS NULL THEN 0 else -1 end)<> (TRGT.close_code_c_key);