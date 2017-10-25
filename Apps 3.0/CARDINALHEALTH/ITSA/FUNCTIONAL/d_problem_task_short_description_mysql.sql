SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from cardinalhealth_mdwdb.d_problem_task d
JOIN cardinalhealth_mdsdb.problem_task_final i
on d.row_id=i.sys_id and d.source_id=i.sourceinstance
where i.short_description <> d.short_description)temp;





