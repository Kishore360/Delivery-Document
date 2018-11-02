SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from mcdonalds_mdsdb.u_incident_task_final s
left join mcdonalds_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join mcdonalds_mdwdb.d_configuration_item lkp
on 
COALESCE(s.u_business_service,'UNSPECIFIED')
=lkp.row_id and t.source_id = lkp.source_id
where lkp.row_key <> t.business_service_c_key
) temp