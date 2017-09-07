SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message
FROM (
SELECT count(1) as CNT
FROM svb_mdwdb.d_problem d 
join  svb_mdwdb.f_problem f ON d.row_key = f.problem_key 
JOIN svb_mdwdb.d_lov_map br ON f.state_src_key = br.src_key AND br.dimension_wh_code <> 'CLOSED' 
join (select max(lastupdated) as lastupdated,source_id from svb_mdwdb.d_o_data_freshness group by source_id) dat 
on f.source_id = dat.source_id
where d.over_due_flag <> CASE WHEN d.active_flag='Y' THEN coalesce((case when dat.lastupdated > d.due_on then 'Y' else 'N' end ),'N') ELSE 'N' END
)temp;
