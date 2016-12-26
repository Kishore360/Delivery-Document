
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message  FROM  
 whirlpool_mdsdb.incident_final SRC
  join whirlpool_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN whirlpool_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')
JOIN whirlpool_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
WHERE
if(timestampdiff(SECOND, CONVERT_TZ(a.opened_on,'America/New_York','GMT'), CONVERT_TZ(coalesce(a.last_resolved_on, a.closed_on),'America/New_York','GMT'))>0,timestampdiff(SECOND, CONVERT_TZ(a.opened_on,'America/New_York','GMT'), CONVERT_TZ(coalesce(a.last_resolved_on, a.closed_on),'America/New_York','GMT')),0)
<> f.age

