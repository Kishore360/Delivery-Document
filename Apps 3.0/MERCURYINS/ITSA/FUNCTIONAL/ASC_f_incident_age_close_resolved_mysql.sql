 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM (select * from mercuryins_mdsdb.u_asc_ticket_final where opened_at < coalesce(u_resolved,closed_at)) SRC 
  join mercuryins_mdwdb.f_incident_asc_c f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN mercuryins_mdwdb.d_lov_map br ON f.asc_incident_state_c_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED')

WHERE
timestampdiff(DAY, SRC.opened_at, coalesce(SRC.u_resolved, SRC.closed_at)) <> f.age
  )a
  
  