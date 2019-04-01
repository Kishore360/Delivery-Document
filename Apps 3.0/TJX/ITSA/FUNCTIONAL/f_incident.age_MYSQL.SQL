
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM (select sys_updated_on,sys_id,sourceinstance,opened_at,resolved_at,closed_at 
from tjx_mdsdb.incident_final where opened_at < coalesce(resolved_at,closed_at)) SRC 
  join tjx_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN tjx_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')
JOIN tjx_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
WHERE
timestampdiff(second, convert_tz(convert_tz(SRC.opened_at,'GMT','America/New_York'),'America/New_York','GMT'), 
coalesce(convert_tz(convert_tz(SRC.resolved_at,'GMT','America/New_York'),'America/New_York','GMT'), 
convert_tz(convert_tz(SRC.closed_at,'GMT','America/New_York'),'America/New_York','GMT'),
convert_tz(convert_tz(SRC.sys_updated_on,'GMT','America/New_York'),'America/New_York','GMT'))) <> f.age and f.soft_deleted_flag='N'
  )a
  
  
  
  