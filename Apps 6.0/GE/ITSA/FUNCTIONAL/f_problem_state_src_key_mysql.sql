

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM ge_mdsdb.problem_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ge_mdwdb.f_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN ge_mdwdb.d_lov LKP 
 ON ( concat('STATE','~','PROBLEM','~',upper(problem_state)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.problem_state IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.state_src_key ,'')
