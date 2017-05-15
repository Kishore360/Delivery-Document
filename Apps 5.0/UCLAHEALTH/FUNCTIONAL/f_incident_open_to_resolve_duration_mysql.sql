SELECT CASE WHEN count(1) > 0 AND (SOURCE-TARGET) IN (3600,-3600)   THEN 'WARNING:DST ISSUE' 
WHEN count(1) > 0 AND (SOURCE-TARGET) not in (3600,-3600)  THEN 'FAILURE' 
ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) > 0 AND (SOURCE-TARGET) IN (3600,-3600)   THEN 'WARNING:DST ISSUE' 
WHEN count(1) > 0 AND (SOURCE-TARGET) not in (3600,-3600)  THEN 'FAILURE' 
ELSE 'SUCCESS' END as Message from 

(
SELECT CASE WHEN TIMESTAMPDIFF(SECOND,
                SRC.opened_at,
                SRC.u_resolved_date) < 0 THEN NULL    
                ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,coalesce(SRC.u_resolved_date,SRC.closed_at,SRC.sys_updated_on)) END  SOURCE, TRGT.open_to_resolve_duration TARGET
FROM uclahealth_mdsdb.incident_final SRC
  JOIN uclahealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN uclahealth_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('CLOSED','RESOLVED')
AND CASE WHEN TIMESTAMPDIFF(SECOND,
                SRC.opened_at,
                SRC.u_resolved_date) < 0 THEN NULL    
                ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,coalesce(SRC.u_resolved_date,SRC.closed_at,SRC.sys_updated_on)) END  <> TRGT.open_to_resolve_duration)B