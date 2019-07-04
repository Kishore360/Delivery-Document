SELECT  SRC.u_resolved,SRC.closed_at,SRC.sys_updated_on,CONVERT_TZ(coalesce( SRC.u_resolved,SRC.closed_at,SRC.sys_updated_on),'GMT','America/Los_Angeles'), TRGT.last_resolved_on ,count(1) --  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.incident_final SRC
JOIN meritsa_mdwdb.d_incident TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.CDCTYPE<>'D'
JOIN meritsa_mdwdb.d_lov_map br ON TRGT.state_src_key = br.src_key
AND  br.dimension_class = 'STATE~INCIDENT' and  br.dimension_wh_code  in  ('CLOSED','RESOLVED') 
WHERE 
 
 CONVERT_TZ(coalesce( SRC.resolved_at,SRC.closed_at,SRC.sys_updated_on),'GMT','America/Los_Angeles')<> TRGT.last_resolved_on group by SRC.sys_id;