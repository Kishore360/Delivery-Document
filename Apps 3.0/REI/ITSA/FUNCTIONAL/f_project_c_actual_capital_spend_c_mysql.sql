SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from rei_mdwdb.f_project_c a  join
rei_mdsdb.pm_project_final c 
on a.row_id=c.sys_id and a.source_id=c.sourceinstance
where  COALESCE(c.u_actual_capital_spend,0)<>a.actual_capital_spend_c)c

