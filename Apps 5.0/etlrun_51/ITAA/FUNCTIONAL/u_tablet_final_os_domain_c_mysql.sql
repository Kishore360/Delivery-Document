SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from wow_mdsdb.u_tablet_final s
inner join wow_mdwdb.d_configuration_item t
on s.sourceinstance= t.source_id
and s.sys_id=t.row_id
and s.u_os_domain<>t.os_domain_c)temp;