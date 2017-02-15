SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.problem_task_final SRC 
 LEFT JOIN cardinalhealth_mdsdb.problem_final lkp_s ON SRC.problem=lkp_s.sys_id 
	AND SRC.sourceinstance=lkp_s.sourceinstance
 LEFT JOIN cardinalhealth_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_internal_organization LKP 
 ON COALESCE(CONCAT('GROUP~',LEFT(lkp_s.u_causal_assignment_group,32)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN lkp_s.u_causal_assignment_group IS NULL THEN 0 else -1 end)
 <> (TRGT.causal_assignment_group_c_key))temp;
 