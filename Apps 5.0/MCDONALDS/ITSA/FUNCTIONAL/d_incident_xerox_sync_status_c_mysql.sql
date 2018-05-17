SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.xerox_sync_status_c' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM mcdonalds_mdsdb.incident_final WHERE CDCTYPE<>'D') SRC  LEFT JOIN mcdonalds_mdwdb.d_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.u_xerox_sync_status,'')<> COALESCE(TRGT.xerox_sync_status_c ,'') 