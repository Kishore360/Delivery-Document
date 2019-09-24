SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.problem_incident_c_key' ELSE 'SUCCESS' END as Message 
FROM rogers6_mdsdb.problem_final  SRC 
JOIN rogers6_mdwdb.f_problem TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN rogers6_mdwdb.d_incident LKP 
ON ( concat( '' ,upper( SRC.u_incident)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_incident IS NULL THEN 0 else -1 end)<> (TRGT.problem_incident_c_key) 
and SRC.CDCTYPE='X' and LKP.soft_deleted_flag='N'
