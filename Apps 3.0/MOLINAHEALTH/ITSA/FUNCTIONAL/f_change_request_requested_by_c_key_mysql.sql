 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.change_request_final SRC
 LEFT JOIN molinahealth_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN molinahealth_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',u_requested_by)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND COALESCE(CONVERT_TZ (SRC.opened_at,'GMT','America/Los_Angeles'), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),'GMT','America/Los_Angeles')BETWEEN LKP.effective_from AND LKP.effective_to) )
where COALESCE(LKP.row_key,CASE WHEN SRC.u_requested_by IS NULL THEN 0 else -1 end) <> (TRGT.requested_by_c_key) ;

