SELECT CASE WHEN cnt>1  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>1  THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as cnt from 
rogers_mdsdb.incident_final  SRC JOIN rogers_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE convert_tz(SRC.sys_created_on,'GMT','America/New_York')<> (TRGT.opened_on)
and SRC.CDCTYPE='X' ) temp;