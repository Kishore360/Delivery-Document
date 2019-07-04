SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.task_final SRC 
JOIN meritsa_mdwdb.f_task_c TRGT 
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
WHERE SRC.sys_class_name in ('CHANGE_REQUEST','PROBLEM','CHANGE_TASK','PROBLEM_TASK','em_ci_severity_task','FACILITIES','HR_CASE',
'KB_SUBMISSION','PM_PROJECT','PM_PROJECT_TASK','RM_DEFECT','sn_customerservice_case','SYSAPPROVAL_GROUP','TASK',
'TICKET','U_ASC_TICKET','U_INCIDENT_TASK','U_PROBLEM_TASK','U_SHIFT_TURNOVER_REPORT','VTB_TASK') and CONVERT_TZ(SRC.sys_created_on,'GMT','America/Los_Angeles')<>TRGT.created_on
