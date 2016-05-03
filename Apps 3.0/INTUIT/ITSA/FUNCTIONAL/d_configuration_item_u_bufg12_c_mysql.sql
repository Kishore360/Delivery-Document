 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.cmdb_ci_final s
join intuit_mdsdb.u_bufg_final c ON (s.u_bufg_l2=c.sys_id)
left join intuit_mdwdb.d_configuration_item t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where c.u_name <> t.u_bufg12_c) temp
