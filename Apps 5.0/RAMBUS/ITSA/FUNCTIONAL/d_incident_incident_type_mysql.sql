 
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
from rambus_mdwdb.d_incident a
left join rambus_mdsdb.incident_final b
on a.row_id=b.sys_id and
a.source_id=b.sourceinstance
where a.incident_type <>b.u_ticket_type )z ;