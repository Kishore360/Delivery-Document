SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_business_duration_c' ELSE 'SUCCESS' END as Message
FROM nypres_mdwdb.f_incident TRGT 
JOIN nypres_mdsdb.incident_final SRC 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
WHERE TRGT.business_duration_c <> CASE WHEN SRC.business_duration is NULL  THEN NULL
				WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.business_duration) < 0 THEN NULL
				ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.business_duration) END;
