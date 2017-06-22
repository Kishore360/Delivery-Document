SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from 
(select count(1) cnt  
 FROM  svb_mdsdb.problem_final SRC
 JOIN svb_mdwdb.d_problem TRGT  
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
 LEFT JOIN svb_mdwdb.d_lov LKP 
 ON ( concat('ESCALATION','~','PROBLEM','~','~','~',escalation)= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.escalation IS NULL THEN 0 else -1 end)<> (TRGT.escalation_src_c_key) )b


