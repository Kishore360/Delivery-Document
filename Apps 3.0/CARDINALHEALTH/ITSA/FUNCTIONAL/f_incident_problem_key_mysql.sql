

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.problem_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM cardinalhealth_mdsdb.incident_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN cardinalhealth_mdwdb.d_problem LKP 
 ON ( SRC.problem_id= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE TRGT.soft_deleted_flag='N' and LKP.soft_deleted_flag='N' and
 COALESCE(LKP.row_key,CASE WHEN SRC.problem_id IS NULL THEN 0 else -1 end)<> (TRGT.problem_key))b