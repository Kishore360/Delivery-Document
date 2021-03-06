SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.xerox_ticket_number_c' ELSE 'SUCCESS' END as Message
 FROM mcdonalds_mdsdb.incident_final SRC  LEFT JOIN mcdonalds_mdwdb.d_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.u_xerox_ticket_number,'')<> COALESCE(TRGT.xerox_ticket_number_c ,'')