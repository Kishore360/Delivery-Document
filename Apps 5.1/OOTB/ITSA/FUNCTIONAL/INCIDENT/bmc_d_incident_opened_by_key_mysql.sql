SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_incident.opened_by_key' ELSE 'SUCCESS' END as Message 
 FROM schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT 
 ON (SRC.incident_number = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN schneider_mdwdb.d_internal_contact LKP ON ( concat( 'INTERNAL_CONTACT~' ,upper( SRC.submitter)) = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.submitter IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key) 
