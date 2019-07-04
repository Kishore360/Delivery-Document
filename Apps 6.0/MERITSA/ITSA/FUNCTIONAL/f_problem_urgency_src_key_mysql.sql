SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.urgency_src_key' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.problem_final  SRC 
JOIN meritsa_mdwdb.f_problem TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  and SRC.CDCTYPE<>'D'
JOIN meritsa_mdwdb.d_lov LKP 
ON COALESCE( concat( 'URGENCY~problem~' ,upper( SRC.urgency)),'UNSPECIFIED') = LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> (TRGT.urgency_src_key) 
