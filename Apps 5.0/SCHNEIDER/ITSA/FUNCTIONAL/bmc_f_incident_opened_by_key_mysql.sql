

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' 
ELSE 'MDS to DWH data validation passed for f_incident.opened_by_key' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id   and TRGT.soft_deleted_flag = 'N'
Left join schneider_mdsdb.ctm_people_final src_lkp on SRC.submitter = src_lkp.remedy_login_id and SRC.sourceinstance = src_lkp.sourceinstance
left join schneider_mdwdb.d_internal_contact lkp on  CONCAT('INTERNAL_CONTACT~',src_lkp.person_id) = lkp.row_id and src_lkp.sourceinstance = lkp.source_id 
where (case when SRC.submitter is null then 0 when SRC.submitter is not null and src_lkp.person_id is null then -1 when SRC.submitter is not null and  src_lkp.person_id is not null then lkp.row_key else -1 end) <> coalesce(TRGT.opened_by_key,-1)) a;