SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.backlog_flag' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
ntrs_mdsdb.u_problem_task_final SRC
join
ntrs_mdwdb.d_problem_task TRGT
on (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
where
TRGT.backlog_flag<>(
CASE 
when COALESCE((SELECT
dimension_wh_code 
FROM
ntrs_mdwdb.d_lov_map 
WHERE
d_lov_map.dimension_class = 'STATE~PROBLEM_TASK' 
AND d_lov_map.dimension_code = SRC.state 
AND d_lov_map.source_id = SRC.sourceinstance),
'UNKNOWN') IN  ('OPEN') then  'Y' 
else 'N' end)
and SRC.cdctype='X') temp;






