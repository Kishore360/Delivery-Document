
SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.business_service_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM png_mdsdb.incident_final SRC 
JOIN png_mdwdb.f_incident TRGT 
ON SRC.number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
LEFT JOIN png_mdwdb.d_service LKP 
 ON ( COALESCE(CONCAT('BUSINESS_SERVICE','~',SRC.business_service),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.business_service IS NULL THEN 0 else -1 end)<> (TRGT.business_service_key)) a;

 
 