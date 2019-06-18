SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.task_final SRC
JOIN mercury_mdwdb.f_task_c TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join mercury_mdwdb.d_internal_contact LKP
on case when SRC.assigned_to is null then 'UNSPECIFIED' else concat('INTERNAL_CONTACT~',SRC.assigned_to) end=LKP.row_id
WHERE SRC.sys_class_name in ('CHANGE_REQUEST','PROBLEM','CHANGE_TASK','PROBLEM_TASK','em_ci_severity_task','FACILITIES','HR_CASE',
'KB_SUBMISSION','PM_PROJECT','PM_PROJECT_TASK','RM_DEFECT','sn_customerservice_case','SYSAPPROVAL_GROUP','TASK',
'TICKET','U_ASC_TICKET','U_INCIDENT_TASK','U_PROBLEM_TASK','U_SHIFT_TURNOVER_REPORT','VTB_TASK') and coalesce(LKP.row_key,case when SRC.assigned_to is null then  0 else -1 end )<>TRGT.assigned_to_key
