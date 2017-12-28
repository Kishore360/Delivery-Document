SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.closed_by_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
 JOIN schneider_mdwdb.d_internal_contact LKP ON LKP.row_id =  concat('INTERNAL_CONTACT~',SRC.last_modified_by)
where  LKP.row_key <> TRGT.closed_by_key ) a;

