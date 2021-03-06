SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from rei_mdwdb.d_project a  join
rei_mdsdb.pm_project_final c on a.row_id=c.sys_id and a.source_id=c.sourceinstance
 join rei_mdwdb.d_lov b
 on COALESCE(CONCAT('DIVISION~PM_PROJECT~~~',u_division),'UNSPECIFIED')=b.row_id
and COALESCE(b.row_key,case when c.u_division is null then 0 else -1 end )<>a.division_src_c_key)c