SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(1) as cnt
from rei_mdwdb.d_problem  a 
join rei_mdwdb.f_problem  b 
ON a.row_key = b.problem_key AND a.source_id = b.source_id
join
rei_mdwdb.d_lov_map lkp
ON  b.state_src_key = lkp.src_key AND lkp.dimension_class = 'STATE~PROBLEM'
where 
case when lkp.dimension_wh_code IN('CLOSED','RESOLVED') then coalesce( a.closed_on,a.changed_on)
else NULL end <>a.closed_on)c ;