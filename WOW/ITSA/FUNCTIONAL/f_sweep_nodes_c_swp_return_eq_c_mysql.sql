SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from wow_mdsdb.u_sweep_nodes_final a
left join wow_mdwdb.f_sweep_nodes_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
where  a.u_swp_return_eq  <> b.swp_return_eq_c)g

