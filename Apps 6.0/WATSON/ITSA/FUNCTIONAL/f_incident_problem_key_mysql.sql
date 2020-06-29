SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.problem_key' 
ELSE 'SUCCESS' END as Message FROM ibmwatson_mdsdb.incident_final  SRC 
JOIN ibmwatson_mdwdb.f_incident TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN ibmwatson_mdwdb.d_problem LKP 
 ON ( concat( '' ,upper( SRC.problem_id)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.problem_id IS NULL THEN 0 else -1 end)<> (TRGT.problem_key) 
