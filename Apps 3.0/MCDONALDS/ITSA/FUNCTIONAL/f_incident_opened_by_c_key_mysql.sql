SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.opened_by' ELSE 'SUCCESS' END as Message 
FROM <<tenant>>_mdsdb.incident_final  SRC 
JOIN <<tenant>>_mdwdb.f_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
ON ( concat( 'INTERNAL_CONTACT~' ,upper( SRC.opened_by)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_c_key) 
