SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from rei_mdwdb.f_project_c a  join
rei_mdsdb.pm_project_final c 
on a.row_id=c.sys_id and a.source_id=c.sourceinstance
 join rei_mdwdb.d_project b on
 c.sys_id= b.row_id
where  COALESCE(b.row_key,case when c.sys_id is null then 0  else -1 end )<>a.project_c_key)c

