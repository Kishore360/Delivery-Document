SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.suB_cause_code_c_key' ELSE 'SUCCESS' END as Message
FROM truist_mdsdb.problem_final SRC 
 LEFT JOIN truist_mdwdb.d_problem TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN truist_mdwdb.d_lov LKP 
 ON  LKP.dimension_class =  'SUB_CAUSE_CODE_C~PROBLEM' and (concat('SUB_CAUSE_CODE_C~PROBLEM~~~',upper(SRC.u_sub_cause_code))= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_sub_cause_code IS NULL THEN 0 else -1 end) <> (TRGT.sub_cause_code_c_key);
