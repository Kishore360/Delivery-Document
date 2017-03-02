SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdwdb.d_problem_task d
JOIN cardinalhealth_mdsdb.problem_task_final i ON d.row_id=i.sys_id AND d.source_id=i.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.u_classification_final c ON c.sys_id=i.u_classification AND c.sourceinstance=i.sourceinstance
where d.permanent_resolution_c_flag <> CASE WHEN i.u_permanent_resolution = 1 THEN  'Y' ELSE 'N' END)temp;
