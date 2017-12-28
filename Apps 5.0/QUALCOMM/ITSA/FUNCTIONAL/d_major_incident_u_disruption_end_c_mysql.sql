SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_major_incident.u_disruption_end_c' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.u_major_incident_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_major_incident_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
<<<<<<< HEAD
WHERE TRGT.u_disruption_end_c <>  CONVERT_TZ(SRC.u_disruption_end,'GMT','GMT');
=======
WHERE TRGT.u_disruption_end_c<> CONVERT_TZ(SRC.u_disruption_end,'GMT','GMT');
>>>>>>> 173a273a5c9ca02e0c3aa4910136dbb1a4fc6c24
