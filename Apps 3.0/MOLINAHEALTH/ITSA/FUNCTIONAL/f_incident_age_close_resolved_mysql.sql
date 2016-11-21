/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM 
(select opened_at,resolved_at,closed_at,sys_id,sourceinstance from molinahealth_mdsdb.incident_final where opened_at < coalesce(resolved_at,closed_at)) SRC 
  join molinahealth_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN molinahealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')

WHERE 
timestampdiff(second, convert_tz(convert_tz(SRC.opened_at,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'), 
coalesce(convert_tz(convert_tz(SRC.resolved_at,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'), 
convert_tz(convert_tz(SRC.closed_at,'GMT','America/Los_Angeles'),'America/Los_Angeles','GMT'))) <> f.age

  )a
  
  