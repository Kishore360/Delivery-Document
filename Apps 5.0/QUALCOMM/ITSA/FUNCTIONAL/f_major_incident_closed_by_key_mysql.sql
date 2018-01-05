SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident.closed_by_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.u_major_incident_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_major_incident_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN  qualcomm_mdwdb.d_major_incident_c A 
 ON TRGT.major_incident_c_key = A.row_key  
 JOIN qualcomm_mdwdb.d_lov_map br 
ON (TRGT.major_incident_state_key = br.src_key AND br.dimension_class = 'STATE~U_MAJOR_INCIDENT' )
AND br.dimension_wh_code ='CLOSED'
 LEFT JOIN qualcomm_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id
AND TRGT.pivot_date between LKP.effective_from and LKP.effective_to)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key)