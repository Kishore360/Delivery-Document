SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_application_outage_c.problem_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM cardinalhealth_mdsdb.task_outage_final SRC 
 JOIN cardinalhealth_mdsdb.incident_final TRGT
ON SRC.task = TRGT.sys_id and SRC.sourceinstance = TRGT.sourceinstance  
 JOIN cardinalhealth_mdwdb.f_incident LKP1 
 ON (TRGT.sys_id= LKP1.row_id and TRGT.sourceinstance=LKP1.source_id )
   JOIN cardinalhealth_mdwdb.d_problem LKP2 
 ON ( TRGT.problem_id= LKP2.row_id 
AND TRGT.sourceinstance= LKP2.source_id )
 WHERE COALESCE(LKP2.row_key,CASE WHEN TRGT.problem_id IS NULL THEN 0 else -1 end)<> (LKP1.problem_key))b