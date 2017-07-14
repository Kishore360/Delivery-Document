 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_problem d 
JOIN svb_mdwdb.d_lov_map br ON d.state_src_key = br.src_key AND br.dimension_wh_code = 'CLOSED'
where  d.over_due_flag <> COALESCE((CASE WHEN d.closed_on > d.due_on THEN 'Y' ELSE 'N' END ),'N')
)c		
