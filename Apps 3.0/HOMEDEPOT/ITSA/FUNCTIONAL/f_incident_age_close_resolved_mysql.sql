select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM (select sourceinstance,sys_id,u_incident_resolved_date_time,opened_at,closed_at from homedepot_mdsdb.incident_final where opened_at < coalesce(u_incident_resolved_date_time,closed_at)) SRC 
  join homedepot_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN homedepot_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')
JOIN homedepot_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
WHERE
timestampdiff(DAY, convert_tz(convert_tz(SRC.opened_at,'GMT','America/New_York'),'America/New_York','GMT'), 
coalesce(convert_tz(convert_tz(SRC.u_incident_resolved_date_time,'GMT','America/New_York'),'America/New_York','GMT'), convert_tz(convert_tz(SRC.closed_at,'GMT','America/New_York'),'America/New_York','GMT'))) <> f.age)a
