SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.pm_project_final a
JOIN rei_mdwdb.d_project b
on a.sourceinstance=b.source_id
and a.sys_id = b.row_id
join
rei_mdwdb.d_cost_center c
on coalesce(a.u_cost_center,'UNSPECIFIED')=c.row_id AND c.source_id=b.source_id
where coalesce(c.row_key, case when a.u_cost_center is null then 0 else -1 end)<>b.cost_center_c_key
)a;