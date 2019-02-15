SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident_loc_c.incident_locations_impacted_c_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM pdchs_mdsdb.incident_final SRC 
JOIN pdchs_mdwdb.f_incident_loc_c TRGT 
ON SRC.sys_id = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
LEFT JOIN pdchs_mdwdb.d_incident LKP 
 ON ( SRC.incident_locations_impacted_c_id= LKP.incident_locations_impacted_c_key
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.number IS NULL THEN 0 else -1 end)<> (TRGT.incident_locations_impacted_c_key))a;