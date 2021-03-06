SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.u_initiator_c_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.incident_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN qualcomm_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',u_initiator)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
AND  TRGT.pivot_date between effective_from and effective_to
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_initiator IS NULL THEN 0 else -1 end)<> (TRGT.u_initiator_c_key)
and SRC.CDCTYPE='X';