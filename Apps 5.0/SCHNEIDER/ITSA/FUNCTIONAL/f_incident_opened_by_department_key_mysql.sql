

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_department_key' 
ELSE 'MDS to DWH data validation passed for f_incident.opened_by_department_key' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hp_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id and TRGT.pivot_date between effective_from and effective_to and TRGT.soft_deleted_flag = 'N'
LEFT JOIN schneider_mdwdb.d_internal_contact LKP1
 ON TRGT.opened_by_key = LKP.row_key
 left join schneider_mdwdb.d_internal_organization LKP2
on LKP2.row_id = COALESCE(concat('DEPARTMENT~',LKP1.department_code),'UNSPECIFIED')
and LKP1.source_id = LKP2.source_id
where COALESCE(LKP2.row_key,CASE WHEN (SRC.submitter is  null ) THEN 0 else -1 end)<> (TRGT.opened_by_department_key) 