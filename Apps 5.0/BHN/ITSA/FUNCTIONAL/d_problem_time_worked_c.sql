SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.time_worked_c' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM bhn_mdsdb.incident_final SRC
 LEFT JOIN bhn_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE  TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.time_worked)<>  COALESCE(TRGT.time_worked_c,''))temp;
