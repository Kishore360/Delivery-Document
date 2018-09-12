
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_walk_up_c.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM (select sys_updated_on,sys_id,sourceinstance,opened_at,u_resolved_at,closed_at 
from pan6_mdsdb.u_walk_up_final where opened_at < coalesce(closed_at,u_resolved_at)) SRC 
  join pan6_mdwdb.f_walk_up_c f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN pan6_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')
JOIN pan6_mdwdb.d_walk_up_c a ON a.row_key = f.walk_up_c_key
AND f.source_id = a.source_id
WHERE
timestampdiff(second, convert_tz(convert_tz(SRC.opened_at,'GMT','America/New_york'),'America/New_york','GMT'), 
coalesce(convert_tz(convert_tz(SRC.closed_at,'GMT','America/New_york'),'America/New_york','GMT'), 
convert_tz(convert_tz(SRC.u_resolved_at,'GMT','America/New_york'),'America/New_york','GMT'),
convert_tz(convert_tz(SRC.sys_updated_on,'GMT','America/New_york'),'America/New_york','GMT'))) <> f.age
  )a
  
  
  
  