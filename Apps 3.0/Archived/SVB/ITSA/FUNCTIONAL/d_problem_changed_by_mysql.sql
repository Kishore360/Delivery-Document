SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem.changed_by' ELSE 'SUCCESS' END as Message
FROM
(SELECT count(1) as CNT
 FROM svb_mdsdb.problem_final SRC 
 LEFT JOIN svb_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> (TRGT.changed_by))temp;
 
