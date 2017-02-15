SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.problem_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

 WHERE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_mttd)<> TRGT.mttd_c)temp;
 