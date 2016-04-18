SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.incident_final SRC1 left join
molinahealth_mdsdb.u_major_incident_final SRC on SRC1.sys_id =SRC.sys_id and SRC.sourceinstance=SRC1.sourceinstance
 LEFT JOIN molinahealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN molinahealth_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.u_communications_lead)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_communications_lead IS NULL THEN 0 else -1 end)<> (TRGT.communications_lead_c_key);


