

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for problem_task_final.work_notes' ELSE 'SUCCESS' END as Message
FROM (SELECT Count(1) as CNT  
FROM bbandt_mdsdb.problem_task_final a 
JOIN bbandt_mdsdb.sys_journal_field_final b ON (a.sys_id=b.element_id and a.sourceinstance=b.sourceinstance)
JOIN bbandt_mdwdb.d_problem_task_journal_c c ON (b.sys_id=c.row_id and b.sourceinstance=c.source_id)
where b.name='task' and b.element='work_notes' and a.sys_id is NOT NULL
and b.value<>c.work_notes
)temp;

