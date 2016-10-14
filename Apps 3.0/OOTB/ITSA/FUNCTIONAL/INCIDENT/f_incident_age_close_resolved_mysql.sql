/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM (select sourceinstance,sys_id,opened_at,resolved_at,closed_at from <<tenant>>_mdsdb.incident_final where opened_at < coalesce(resolved_at,closed_at)) SRC 
  join <<tenant>>_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN <<tenant>>_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')

WHERE
timestampdiff(DAY, convert_tz(convert_tz(SRC.opened_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), coalesce(convert_tz(convert_tz(SRC.resolved_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), convert_tz(convert_tz(SRC.closed_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))) <> f.age
  )a
  
 