

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.assigned_to_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
  FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON ( SRC.instanceid = TRGT.row_id  and  SRC.sourceinstance = TRGT.source_id )
LEFT JOIN schneider_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',assigned_id)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_id IS NULL THEN 0 else -1 end)<> (TRGT.assigned_to_key))a;
