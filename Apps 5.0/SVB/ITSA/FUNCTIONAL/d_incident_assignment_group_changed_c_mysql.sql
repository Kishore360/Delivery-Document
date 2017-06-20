

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.assigned_to_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM svb_mdsdb.incident_final SRC 
  JOIN svb_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN svb_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',assigned_to)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
 WHERE convert_tz(SRC.u_assignment_group_changed,'GMT','America/Los_Angeles')<> TRGT.assignment_group_changed_c )b
