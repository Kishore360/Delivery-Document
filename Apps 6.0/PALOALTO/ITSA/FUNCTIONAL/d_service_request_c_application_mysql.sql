SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from paloalto_mdsdb.u_service_request_final s 
left join paloalto_mdwdb.d_service_request_c t on s.sys_id=t.row_id and s.sourceinstance = t.source_id 
left join paloalto_mdsdb.cmdb_ci_final lkp on lkp.sys_id = s.u_application 
WHERE lkp.name<> t.application) temp