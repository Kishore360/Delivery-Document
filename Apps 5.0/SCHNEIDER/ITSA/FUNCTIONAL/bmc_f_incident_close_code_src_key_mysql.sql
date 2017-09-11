
SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.close_code_src_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON  SRC.incident_number = TRGT.row_id  and  SRC.sourceinstance = TRGT.source_id
LEFT JOIN schneider_mdwdb.d_lov LKP 
 ON ( COALESCE(CONCAT('CLOSE_CODE~INCIDENT~~~',SRC.status_reason))) = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.status_reason IS NULL THEN 0 else -1 end)<> (TRGT.close_code_src_key))a;
