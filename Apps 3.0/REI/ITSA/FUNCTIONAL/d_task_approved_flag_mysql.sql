SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from rei_mdwdb.d_task a join 
rei_mdsdb.task_final b on (a.row_id=b.sys_id and a.source_id=b.sourceinstance)
where CASE WHEN approval='approved' THEN 'Y' ELSE 'N' END <>a.approved_flag)c 