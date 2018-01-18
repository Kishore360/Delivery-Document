

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.planned_over_due_flag_c' ELSE 'SUCCESS' END as  Message
FROM 
(
SELECT count(1) as CNT
FROM bbandt_mdsdb.problem_task_final a
JOIN bbandt_mdwdb.d_problem_task b ON (a.sys_id=b.row_id AND a.sourceinstance=b.source_id)
JOIN bbandt_mdwdb.f_problem_task c ON (b.row_key=c.problem_task_key AND b.source_id=c.source_id)
JOIN bbandt_mdwdb.d_lov_map d ON (c.state_src_key=d.src_key AND d.dimension_wh_code <> 'CLOSED')
JOIN 
(SELECT MAX(lastupdated) AS lastupdated,source_id FROM bbandt_mdwdb.d_o_data_freshness group by source_id) ODF ON c.source_id=ODF.source_id
WHERE (CASE WHEN b.active_flag='Y' THEN COALESCE((CASE WHEN ODF.lastupdated >b.u_problem_task_planned_date_c THEN 'Y' ELSE 'N' END),'N') ELSE 'N' END)
<> b.planned_over_due_flag_c
)temp;

