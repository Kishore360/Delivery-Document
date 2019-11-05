SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.description' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
ntrs_mdsdb.u_problem_task_final SRC
join
ntrs_mdwdb.d_problem_task TRGT
on (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
where
TRGT.description<>SRC.description
and SRC.cdctype='X') temp;