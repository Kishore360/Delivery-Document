SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.severity_downgrade_reason_c' ELSE 'SUCCESS' END as Message 
FROM wpl_mdwdb.d_incident trgt
RIGHT JOIN wpl_mdsdb.incident_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE severity_downgrade_reason_c <>u_severity_downgrade_reason and src.cdctype='X'
;

