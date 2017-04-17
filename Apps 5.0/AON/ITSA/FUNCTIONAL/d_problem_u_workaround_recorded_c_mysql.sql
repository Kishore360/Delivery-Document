SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem.u_workaround_recorded_c' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM aon_mdsdb.problem_final SRC 
 LEFT JOIN  aon_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where COALESCE(CASE WHEN u_workaround_recorded=0 THEN 'N' ELSE 'Y' END)
<> TRGT.u_workaround_recorded_c)temp;












 
