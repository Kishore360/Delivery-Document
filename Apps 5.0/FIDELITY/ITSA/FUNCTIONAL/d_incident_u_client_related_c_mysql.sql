SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from fidelity_mdsdb.incident_final s
JOIN fidelity_mdwdb.d_incident t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
WHERE u_client_related <> (t.u_client_related_c)
 ) temp
 
 
 
 
 
 