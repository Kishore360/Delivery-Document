SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt
from mercuryinsurance_mdsdb.u_asc_ticket_final a
left JOIN mercuryinsurance_mdwdb.f_incident_asc_c b
on 
a.sys_id=b.row_id AND a.sourceinstance=b.source_id
LEFT  JOIN  mercuryinsurance_mdwdb.d_lov c
on COALESCE(CONCAT('CALLER_TYPE~ASC_INCIDENT~~~',a.u_caller_type),'UNSPECIFIED')=c.ROW_ID 
AND c.source_id = a.sourceinstance
where 
case when a.u_caller_type is null then 0
when  a.u_caller_type is not null and c.row_key is null then -1
else 
c.row_key end <>b.asc_incident_CALLER_TYPE_c_key)b