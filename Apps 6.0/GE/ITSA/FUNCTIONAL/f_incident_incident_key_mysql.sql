

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.incident_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM ge_mdsdb.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ge_mdwdb.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN ge_mdwdb.d_incident LKP 
 ON ( SRC.sys_id = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else '-1' end)<>  TRGT.incident_key 
