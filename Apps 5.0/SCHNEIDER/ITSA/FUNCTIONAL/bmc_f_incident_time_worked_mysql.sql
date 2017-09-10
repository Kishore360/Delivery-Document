

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.time_worked' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
WHERE  (SRC.last_resolved_date - SRC.reported_date)<>  COALESCE(TRGT.time_worked,''))b
