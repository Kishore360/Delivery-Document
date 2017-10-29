SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.problem_task_final SRC
 LEFT JOIN cardinalhealth_mdsdb.u_complexity_final lkp2 ON lkp2.sys_id=SRC.u_complexity 
	AND lkp2.sourceinstance=SRC.sourceinstance
  JOIN cardinalhealth_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE TRGT.complexity_src_code_c <> lkp2.u_value)temp;
