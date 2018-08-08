

SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.location_key' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt FROM mercuryins_mdsdb.incident_final  SRC 
 LEFT JOIN mercuryins_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN mercuryins_mdwdb.d_location LKP 
 ON ( SRC.location= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 where COALESCE(LKP.row_key,CASE WHEN SRC.location IS NULL THEN 0 else -1 end) <> (TRGT.location_key))b
