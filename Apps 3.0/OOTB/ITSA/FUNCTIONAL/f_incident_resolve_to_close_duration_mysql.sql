
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.resolve_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.incident_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  LEFT JOIN <<tenant>>_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('CLOSED') 
<<<<<<< HEAD
AND  TIMESTAMPDIFF(second, COALESCE(SRC.resolved_at,COALESCE(closed_at,sys_updated_on))<> TRGT.resolve_to_close_duration;
=======
AND  TIMESTAMPDIFF(second, COALESCE(SRC.resolved_at),COALESCE(closed_at,sys_updated_on))<> TRGT.resolve_to_close_duration;
>>>>>>> f1fc2cd6f47dd2f514d6f92abcbce7c893ff8b62
