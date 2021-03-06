SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from gilead_mdsdb.incident_final b 
left join gilead_mdwdb.d_internal_contact d 
on COALESCE(CONCAT('INTERNAL_CONTACT~',b.opened_by),'UNSPECIFIED')=d.row_id 
and  b.sourceinstance=d.source_id
left join gilead_mdwdb.f_incident f 
on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where d.row_key <>f.opened_by_c_key)temp