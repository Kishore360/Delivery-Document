SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from rei_mdwdb.d_internal_organization a  join
rei_mdsdb.sys_user_group_final c on substring(a.row_id,7,32)=c.sys_id and a.source_id=c.sourceinstance
 join rei_mdwdb.d_internal_contact b on c.u_director=substring(b.row_id,18,32)
and a.director_c_key <> b.row_key)c