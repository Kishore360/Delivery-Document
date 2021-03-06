-- Not supported now 
-- Changing the query now to validate with -1.

/*
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_department_key' ELSE 'SUCCESS' END as Message
 
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN  #DWH_TABLE_SCHEMA.d_internal_contact LKP1 
 ON ( concat('INTERNAL_CONTACT~',SRC.caller_id) = LKP1.row_id 
 AND SRC.sourceinstance = LKP1.source_id )
 
 LEFT JOIN   #DWH_TABLE_SCHEMA.d_internal_organization LKP
 ON ( concat('DEPARTMENT~',LKP1.department_code) = LKP.row_id 
 AND LKP1.source_id = LKP.source_id )

LEFT JOIN   #DWH_TABLE_SCHEMA.d_internal_organization LKP2
 ON ( concat('DEPARTMENT~',SRC.caller_id) = LKP2.row_id 
 AND SRC.sourceinstance = LKP2.source_id )
 and LKP.row_id  is null 
 
 WHERE COALESCE(LKP.row_key,LKP2.row_key,CASE WHEN (SRC.caller_id is not null and LKP1.department_code IS NULL 
 or SRC.caller_id is  null)
 THEN 0 else '-1' end)<> COALESCE(TRGT.opened_by_department_key ,'')
*/

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_department_key' ELSE 'SUCCESS' END as Message
 
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE -1 <> COALESCE(TRGT.opened_by_department_key ,'')