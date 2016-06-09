SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) cnt 
from mercuryinsurance_mdsdb.incident_final a
left JOIN mercuryinsurance_mdwdb.f_incident b
on 
a.sys_id=b.row_id AND a.sourceinstance=b.source_id
LEFT  JOIN  mercuryinsurance_mdwdb.d_internal_contact c
on CONCAT('INTERNAL_CONTACT~',a.U_RESOLVED_BY)= c.ROW_ID 
AND c.source_id = a.sourceinstance
where 
case when a.U_RESOLVED_BY is null then 0
when  CONCAT('INTERNAL_CONTACT~',a.U_RESOLVED_BY) is not null and c.row_key is null then -1
else 
c.row_key end <>b.last_resolved_by_key )b