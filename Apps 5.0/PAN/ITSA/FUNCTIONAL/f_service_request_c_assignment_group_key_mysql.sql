SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan_mdsdb.u_service_request_final s
left join pan_mdwdb.f_service_request_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join pan_mdwdb.d_internal_organization lkp
on lkp.row_id = ( concat('GROUP~',s.assignment_group )) 
AND lkp.source_id=s.sourceinstance
WHERE lkp.row_key <> t.assignment_group_key) temp