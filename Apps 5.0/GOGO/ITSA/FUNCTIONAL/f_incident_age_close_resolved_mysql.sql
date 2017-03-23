/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM 
(select opened_at,u_resolved,closed_at,sys_id,sourceinstance from gogo_mdsdb.incident_final where opened_at < coalesce(u_resolved,closed_at)) SRC 
  join gogo_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN gogo_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')

WHERE 
timestampdiff(second, convert_tz(convert_tz(SRC.opened_at,'GMT','America/chicago'),'America/chicago','GMT'), 
coalesce(convert_tz(convert_tz(SRC.u_resolved,'GMT','America/chicago'),'America/chicago','GMT'), 
convert_tz(convert_tz(SRC.closed_at,'GMT','America/chicago'),'America/chicago','GMT'))) <> f.age)a