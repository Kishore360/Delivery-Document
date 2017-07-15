 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_problem d 
JOIN svb_mdwdb.d_lov_map br ON d.state_src_key = br.src_key AND br.dimension_wh_code <> 'CLOSED'
JOIN (SELECT MAX(lastupdated) AS lastupdated,source_id FROM svb_mdwdb.d_o_data_freshness GROUP BY source_id) dat 
ON d.source_id = dat.source_id
where  d.over_due_flag <> CASE WHEN d.active_flag='Y' THEN COALESCE((CASE WHEN dat.lastupdated > d.due_on THEN 'Y' ELSE 'N' END ),'N') ELSE 'N' END 
)c		
