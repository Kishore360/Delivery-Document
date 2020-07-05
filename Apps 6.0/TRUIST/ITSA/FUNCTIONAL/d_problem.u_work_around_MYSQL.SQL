


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem.u_work_around' ELSE 'SUCCESS' END as Message
FROM 
(
  SELECT Count(1) as CNT 
 FROM truist_mdsdb.problem_final a 
 LEFT JOIN truist_mdwdb.d_problem b ON (a.sys_id=b.row_id AND a.sourceinstance=b.source_id)
 WHERE COALESCE(a.u_workaround,'UNSPECIFIED') <> b.work_around
) a 

 

 
 