

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.business_service_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM firstam_mdsdb.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN firstam_mdwdb.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
LEFT JOIN firstam_mdwdb.d_service LKP 
 ON ( CONCAT('BUSINESS_SERVICE~',SRC.cmdb_ci) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.business_service_key ,'')