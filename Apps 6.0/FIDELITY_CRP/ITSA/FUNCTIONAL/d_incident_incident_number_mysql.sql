

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.incident_number' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM fidelity_mdsdb.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN fidelity_mdwdb.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.number ,'')<> COALESCE(TRGT.incident_number ,'')
