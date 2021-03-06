 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.calendar_duration_c' ELSE 'SUCCESS' END as Message
 FROM mcdonalds_mdsdb.incident_final SRC  LEFT JOIN mcdonalds_mdwdb.f_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.calendar_duration),'')<> COALESCE(TRGT.calendar_duration_c ,0) 