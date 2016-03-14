 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM (select * from mercuryinsurance_mdsdb.incident_final where opened_at < coalesce(u_resolved,closed_at)) SRC 
  join mercuryinsurance_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN mercuryinsurance_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED')
JOIN mercuryinsurance_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
WHERE
timestampdiff(DAY, SRC.opened_at, coalesce(SRC.u_resolved, SRC.closed_at)) <> f.age
  )a
  
  