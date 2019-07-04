
SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
 from (select count(1) as cnt FROM  meritsa_mdsdb.problem_final SRC 
  JOIN meritsa_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id) and SRC.cdctype<>'D'
LEFT JOIN meritsa_mdwdb.d_lov LKP 
 ON ( concat('SEVERITY_LEVEL','~','problem','~',upper(u_severity_level))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN u_severity_level IS NULL THEN 0 else -1 end)<> (TRGT.severity_src_key) )a
