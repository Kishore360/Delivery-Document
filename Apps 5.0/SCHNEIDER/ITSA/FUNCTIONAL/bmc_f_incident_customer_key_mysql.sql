
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.customer_key' 
ELSE 'MDS to DWH data validation passed for f_incident.customer_key' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id  
LEFT JOIN schneider_mdwdb.d_internal_organization LKP 
ON ( concat('SUBSIDIARY~',company))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.customer_key))b
