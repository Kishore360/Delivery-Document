 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM mercuryins_mdsdb.u_asc_ticket_final SRC 
 LEFT JOIN mercuryins_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  LEFT JOIN mercuryins_mdwdb.d_lov_map dlm 
ON TRGT.asc_incident_state_c_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
LEFT JOIN mercuryins_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
AND COALESCE(CONVERT_TZ (SRC.opened_at,'GMT','America/Los_Angeles'), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),'GMT','America/Los_Angeles')BETWEEN LKP.effective_from AND LKP.effective_to) )

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.asc_incident_closed_by_key) ;
 