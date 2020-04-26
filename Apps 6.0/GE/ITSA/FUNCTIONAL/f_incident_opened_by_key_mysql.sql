-- updated as per ITSM-3306, still failing. New JIRA ITSM-3485 (changes related are commented)
-- Changed to query to make it compatible to this release.

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM ge_mdsdb.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ge_mdwdb.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN ge_mdwdb.d_internal_contact LKP 
 -- ON ( concat('INTERNAL_CONTACT~',coalesce(SRC.caller_id,SRC.opened_by)) = LKP.row_id 
ON ( concat('INTERNAL_CONTACT~',SRC.caller_id) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 -- WHERE COALESCE(LKP.row_key,CASE WHEN coalesce(SRC.caller_id,SRC.opened_by) IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.opened_by_key ,'')
WHERE COALESCE(CASE WHEN SRC.caller_id IS NULL THEN 0 else LKP.row_key end)<>  TRGT.opened_by_key  
