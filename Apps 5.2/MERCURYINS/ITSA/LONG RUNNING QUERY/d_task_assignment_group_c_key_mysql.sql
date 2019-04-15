SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdsdb.task_final  SRC 
JOIN mercuryins_mdwdb.d_task TRGT 
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join mercuryins_mdwdb.d_internal_organization LKP
on case when SRC.assignment_group is null then 'UNSPECIFIED' else concat('GROUP~',SRC.assignment_group) end=LKP.row_id
WHERE
SRC.sys_class_name in ('TICKET','INCIDENT','PROBLEM','PROBLEM_TASK','SC_REQ_ITEM','SC_TASK','SC_REQUEST','CHANGE_REQUEST'
,'CHANGE_TASK','U_INCIDENT_TASK',
'KB_SUBMISSION','U_SHIFT_TURNOVER_REPORT','HR_CASE','U_PROBLEM_TASK','U_ASC_TICKET','PM_PROJECT','SYSAPPROVAL_GROUP'
,'VTB_TASK','RM_DEFECT','FACILITIES','TASK') and
coalesce(LKP.row_key,case when SRC.assignment_group is null then  0 else -1 end )<>TRGT.assignment_group_c_key

