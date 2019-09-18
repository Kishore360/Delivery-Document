SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.u_asc_ticket_final  SRC 
JOIN mercury_mdwdb.d_incident_asc_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE CONCAT('<a href=\"','https://mercury.service-now.com/nav_to.do?uri=','incident.do?sys_id=',SRC.sys_id,'\" target=\"_blank\">',SRC.number,'</a>')
<>(TRGT.source_url) and SRC.CDCTYPE<>'D'