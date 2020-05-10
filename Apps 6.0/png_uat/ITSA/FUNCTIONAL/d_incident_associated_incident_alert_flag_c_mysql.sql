
SELECT 
CASE WHEN count(1) > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) > 0  THEN 'MDS to DWH data validation failed for d_incident.associated_incident_alert_flag_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT trgt.row_id,src.sys_id,u_incident_alert,associated_incident_alert_flag_c
FROM
png_mdwdb.d_incident trgt
RIGHT JOIN png_mdsdb.incident_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE case when src.u_incident_alert is not null THEN 'Y' ELSE 'N'END <>associated_incident_alert_flag_c
) temp;
