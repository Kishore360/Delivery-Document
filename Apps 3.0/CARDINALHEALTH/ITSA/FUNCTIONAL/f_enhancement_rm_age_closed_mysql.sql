 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_walk_up_c.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM (select sys_updated_on,sys_id,sourceinstance,opened_at,closed_at 
from cardinalhealth_mdsdb.rm_enhancement_final where opened_at < coalesce(closed_at)) SRC 
  join cardinalhealth_mdwdb.f_enhancement_rm f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN cardinalhealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('CLOSED') AND br.dimension_class = 'STATE_C~RM_ENHANCEMENT'
JOIN cardinalhealth_mdwdb.d_enhancement_rm_c a ON a.row_key = f.enhancement_c_key
AND f.source_id = a.source_id
WHERE
timestampdiff(second, convert_tz(convert_tz(SRC.opened_at,'GMT','America/New_york'),'America/New_york','GMT'), 
convert_tz(convert_tz(SRC.closed_at,'GMT','America/New_york'),'America/New_york','GMT')) <> f.age
  )a