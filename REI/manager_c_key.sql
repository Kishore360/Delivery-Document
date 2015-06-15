SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from rei_mdwdb.d_project a  join
rei_mdsdb.pm_project_final c on a.row_id=c.sys_id and a.source_id=c.sourceinstance
 join rei_mdwdb.d_internal_contact b on c.u_project_manager=substring(b.row_id,18,32)
and a.manager_c_key <> b.row_key)c