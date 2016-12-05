

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tjx_mdsdb.incident_final b
left join tjx_mdwdb.d_internal_contact a
on a.row_id=CONCAT('INTERNAL_CONTACT~',b.u_mi_primary_owner) and b.sourceinstance=a.source_id
 join  tjx_mdwdb.f_incident c
on  c.row_id=b.sys_id  and b.sourceinstance=c.source_id
WHERE COALESCE(a.row_key,CASE WHEN b.u_mi_primary_owner IS NULL THEN 0 else -1 end)<>c.mi_primary_owner_c_key) temp;

