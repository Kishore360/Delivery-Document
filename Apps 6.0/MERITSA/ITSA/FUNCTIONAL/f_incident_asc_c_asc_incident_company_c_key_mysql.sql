

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.company_key' ELSE 'SUCCESS' END as Message
 FROM meritsa_mdsdb.u_asc_ticket_final SRC 
 LEFT JOIN meritsa_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN meritsa_mdwdb.d_internal_organization LKP 
 ON ( concat('SUBSIDIARY~',company)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.asc_incident_company_c_key)
