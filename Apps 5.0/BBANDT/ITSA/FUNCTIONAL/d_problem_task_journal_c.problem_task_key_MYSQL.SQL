

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task_journal_c.problem_task_key' ELSE 'SUCCESS' END as Message
FROM (SELECT Count(1) as CNT  
FROM bbandt_mdsdb.problem_task_final a 
JOIN bbandt_mdsdb.sys_journal_field_final b ON (a.sys_id=b.element_id and a.sourceinstance=b.sourceinstance)
JOIN bbandt_mdwdb.d_problem_task_journal_c c ON (b.sys_id=c.row_id and b.sourceinstance=c.source_id)
JOIN bbandt_mdwdb.d_problem_task d ON (a.sys_id=d.row_id and a.sourceinstance=d.source_id)
where b.name='task' and b.element='work_notes' and a.sys_id is NOT NULL
and  (COALESCE(b.element_id,'UNSPECIFIED')=d.row_id and b.sourceinstance=d.source_id)
and COALESCE(d.row_key,CASE WHEN b.element_id IS NULL THEN 0 ELSE -1 END)<>c.problem_task_key
)temp;