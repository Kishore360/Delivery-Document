select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) cnt FROM 
 meritsa_mdsdb.u_asc_ticket_final  SRC 
  join meritsa_mdwdb.f_incident_asc_c f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )
join meritsa_mdwdb.d_incident_asc_c d ON (f.incident_asc_c_key=d.row_key and f.soft_deleted_flag='N' )
JOIN meritsa_mdwdb.d_lov_map br ON f.asc_incident_state_c_key = br.src_key
AND br.dimension_wh_code IN ('CLOSED','RESOLVED') and br.dimension_class = 'STATE~ASC_INCIDENT'
WHERE 


timestampdiff(SECOND, d.opened_on,coalesce(d.last_resolved_on,d.closed_on)) <> f.age
  )a