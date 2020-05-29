SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from #MDS_TABLE_SCHEMA.problem_final s
left join #DWH_TABLE_SCHEMA.d_problem t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE s.reassignment_count <> t.reassignment_count
) temp


