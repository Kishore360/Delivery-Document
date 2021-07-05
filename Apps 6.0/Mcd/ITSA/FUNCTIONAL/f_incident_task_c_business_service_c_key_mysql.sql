SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from mcd_mdsdb.incident_task_final s
left join mcd_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join mcd_mdwdb.d_configuration_item lkp
on 
COALESCE(s.business_service,'UNSPECIFIED')
=lkp.row_id and t.source_id = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN s.business_service IS NULL THEN 0 else -1 end)<> (t.business_service_key)
) temp