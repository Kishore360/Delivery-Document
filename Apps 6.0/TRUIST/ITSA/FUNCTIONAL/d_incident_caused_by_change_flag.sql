


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caused_by_change_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM truist_mdsdb.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN truist_mdwdb.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CASE WHEN SRC.caused_by is not null then 'Y' else 'N' END ,'')<> COALESCE(TRGT.caused_by_change_flag ,'')
