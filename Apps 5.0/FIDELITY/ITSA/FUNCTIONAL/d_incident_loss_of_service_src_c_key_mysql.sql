SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from fidelity_mdsdb.incident_final s
JOIN fidelity_mdwdb.d_incident t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
left join fidelity_mdwdb.d_lov l
on concat('U_LOSS_OF_SERVICE~INCIDENT~~~',upper(s.u_loss_of_service))=l.row_id 
WHERE COALESCE(l.row_key,CASE WHEN s.u_loss_of_service IS NULL THEN 0 else -1 end)<> (t.loss_of_service_src_c_key)
 ) temp
 
 
 
 