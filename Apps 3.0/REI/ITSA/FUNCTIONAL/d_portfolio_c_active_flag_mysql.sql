SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.pm_portfolio_final a
JOIN rei_mdwdb.d_portfolio_c b
on a.sourceinstance=b.source_id
and a.sys_id = b.row_id
where case when a.active = 1 then 'Y' else 'N' end  <>b.active_flag)a;