SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_fcr_check' ELSE 'SUCCESS' END as Message FROM rogersdev_mdsdb.incident_final  SRC 
JOIN rogersdev_mdwdb.d_incident TRGT
 ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE CONVERT_TZ(SRC.sys_created_on,'GMT','America/New_York') <> (TRGT.created_on) 