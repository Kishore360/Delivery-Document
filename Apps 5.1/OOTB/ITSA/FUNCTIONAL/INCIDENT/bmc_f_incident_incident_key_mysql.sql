
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.incident_key' 
ELSE 'MDS to DWH data validation passed for f_incident.incident_key' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id  
LEFT JOIN schneider_mdwdb.d_incident LKP 
ON SRC.incident_number = TRGT.row_id AND SRC.sourceinstance= LKP.source_id 
and LKP.soft_deleted_flag='N' and  TRGT.pivot_date between effective_from and effective_to and TRGT.soft_deleted_flag = 'N'
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.incident_number IS NULL THEN 0 else -1 end) <> (TRGT.incident_key))a;



