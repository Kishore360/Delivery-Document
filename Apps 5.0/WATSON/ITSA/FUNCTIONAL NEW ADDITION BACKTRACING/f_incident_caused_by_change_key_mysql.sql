

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.caused_by_change_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM watson_mdsdb.incident_final SRC 
  JOIN watson_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN watson_mdwdb.d_change_request LKP 
 ON ( SRC.u_caused_by_change= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_caused_by_change IS NULL THEN 0 else -1 end)<> (TRGT.caused_by_change_key))b
 
 
 