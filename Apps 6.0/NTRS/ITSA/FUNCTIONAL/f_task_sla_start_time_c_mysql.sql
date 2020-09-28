
				


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.due_on' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
ntrs_mdsdb.task_sla_final SRC
join
ntrs_mdwdb.f_task_sla TRGT
on (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id and SRC.cdctype='X')
where
TRGT.start_on<>(CONVERT_TZ(SRC.start_time,'UTC','US/Central'))
and SRC.cdctype='X') temp;


