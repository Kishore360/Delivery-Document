 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
nypres_mdsdb.cmdb_ci_appl_final d 
join 
nypres_mdwdb.d_configuration_item p
on p.row_id = d.sys_id and p.source_id = d.sourceinstance
where COALESCE(d.u_number_of_users,'UNSPECIFIED')<>p.number_of_users_c
 )c
