SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM wpl_mdsdb.incident_final SRC 
LEFT JOIN wpl_mdwdb.d_incident TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE CONVERT_TZ (SRC.u_time_to_repair,'GMT','America/New_York') <> TRGT.u_time_to_repair_c
and SRC.CDCTYPE<>'D'