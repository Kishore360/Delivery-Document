

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' 
ELSE 'MDS to DWH data validation passed for f_incident.opened_by_key' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id   and TRGT.soft_deleted_flag = 'N'
LEFT JOIN schneider_mdwdb.d_internal_contact LKP
 ON concat('INTERNAL_CONTACT~',SRC.submitter)  = LKP.row_id
 where COALESCE(LKP.row_key,CASE WHEN SRC.submitter IS NULL THEN 0 else -1 end) <> (TRGT.opened_by_key))b