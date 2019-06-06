SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) cnt 
from mercury_mdsdb.incident_final a
left JOIN mercury_mdwdb.f_incident b
on 
a.sys_id=b.row_id AND a.sourceinstance=b.source_id
LEFT  JOIN  mercury_mdwdb.d_incident c
on a.u_call_back_for_ticket=c.ROW_ID 
AND c.source_id = a.sourceinstance
where 
case when a.u_call_back_for_ticket is null then 0
when  a.u_call_back_for_ticket is not null and c.row_key is null then -1
else 
c.row_key end <>b.call_back_for_ticket_c_key )b