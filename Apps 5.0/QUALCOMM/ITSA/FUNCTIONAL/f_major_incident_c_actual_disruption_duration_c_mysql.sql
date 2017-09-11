SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident_c.actual_disruption_duration_c' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.u_major_incident_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_major_incident_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.u_actual_disruption_time)<> COALESCE(TRGT.actual_disruption_duration_c,'') ;
