SELECT 

CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.planned_over_due_flag_c' ELSE 'SUCCESS' END as  Message
 
FROM 
(select count(1) as cnt from truist_mdsdb.problem_task_final a
 
JOIN truist_mdwdb.d_problem_task d ON (a.sys_id=d.row_id AND a.sourceinstance=d.source_id)
 
JOIN truist_mdwdb.f_problem_task f ON (d.row_key=f.problem_task_key AND d.source_id=f.source_id)
 
JOIN truist_mdwdb.d_lov_map br ON (f.state_src_key=br.src_key AND br.dimension_wh_code <> 'CLOSED')
 
JOIN 
(SELECT MAX(lastupdated) AS lastupdated,source_id FROM truist_mdwdb.d_o_data_freshness group by source_id) ODF 
ON f.source_id=ODF.source_id 

WHERE 
(CASE when date(d.u_problem_task_planned_date_c) is null and date(d.due_on) < date(ODF.lastupdated) then 'Y' 
	 
WHEN d.active_flag='Y' THEN coalesce((case when date(ODF.lastupdated) > date(d.u_problem_task_planned_date_c) then 'Y' else 'N' end ),'N') 
	 ELSE 'N' END
)<>d.planned_over_due_flag_c) temp;