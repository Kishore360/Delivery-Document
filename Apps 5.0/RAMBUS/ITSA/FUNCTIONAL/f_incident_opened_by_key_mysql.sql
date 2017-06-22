SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
from rambus_mdwdb.f_incident a
INNER JOIN rambus_mdsdb.incident_final b ON a.row_id =b.sys_id AND a.source_id=b.sourceinstance
LEFT OUTER JOIN rambus_mdwdb.d_internal_contact c
on c.row_id=concat('INTERNAL_CONTACT~',b.u_affected_client)
where a.opened_by_key<>c.row_key) a;