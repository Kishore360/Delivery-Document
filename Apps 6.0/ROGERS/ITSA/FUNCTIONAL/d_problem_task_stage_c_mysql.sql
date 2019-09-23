SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem_task.stage_c' ELSE 'SUCCESS' END as Message 
FROM rogers6_mdwdb.d_problem_task a 
join rogers6_mdwdb.f_problem_task f 
on a.row_key=f.problem_task_key AND a.source_id=f.source_id
  join rogers6_mdwdb.d_lov_map  b on f.state_src_key = b.src_key
 JOIN rogers6_mdwdb.d_lov c  on f.state_src_key = c.row_key AND c.source_id=f.source_id
 LEFT JOIN (
select source_id,max(lastupdated) as lastupdated from  rogers6_mdwdb.d_o_data_freshness
group by source_id
) df ON a.source_id = df.source_id
WHERE case when b.dimension_wh_code in ('CLOSED') then 'Completed'
	when b.dimension_wh_code = 'OPEN' and a.due_on >= df.lastupdated THEN 'Work In Progress'
	when b.dimension_wh_code = 'OPEN' and a.due_on < df.lastupdated THEN 'Outstanding' END <>a.stage_c
 and a.soft_deleted_flag='N' and f.soft_deleted_flag='N' and c.soft_deleted_flag='N' and b.soft_deleted_flag='N';