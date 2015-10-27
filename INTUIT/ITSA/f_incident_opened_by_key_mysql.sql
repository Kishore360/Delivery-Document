SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.incident_final a 
left JOIN intuit_mdwdb.f_incident b 
 ON a.sys_id = b.row_id  AND a.sourceinstance = b.source_id 
left join intuit_mdwdb.d_internal_contact   c
on c.row_id = COALESCE(CONCAT('INTERNAL_CONTACT~',a.u_client),'UNSPECIFIED') and a.sourceinstance = c.source_id  
where  c.row_key <> b.opened_by_key
) g