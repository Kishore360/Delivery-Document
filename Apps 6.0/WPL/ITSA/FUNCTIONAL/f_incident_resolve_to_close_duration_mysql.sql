
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.resolve_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM wpl_mdsdb.incident_final SRC
 LEFT JOIN wpl_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  LEFT JOIN wpl_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('CLOSED') 
AND  TIMESTAMPDIFF(second,SRC.closed_at,resolved_at)
<> TRGT.resolve_to_close_duration and SRC.cdctype='X'
