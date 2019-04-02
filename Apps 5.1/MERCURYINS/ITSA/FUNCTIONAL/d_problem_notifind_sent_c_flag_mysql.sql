SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.notifind_sent_c_flag' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdsdb.problem_final  SRC 
JOIN mercuryins_mdwdb.d_problem TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE (CASE WHEN SRC.u_notifind_sent = 1 then 'Y' else 'N' END) <> (TRGT.notifind_sent_c_flag) 
