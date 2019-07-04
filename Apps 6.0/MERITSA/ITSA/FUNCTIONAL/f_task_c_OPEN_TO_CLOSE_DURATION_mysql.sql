SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from meritsa_mdsdb.task_final SRC
join
meritsa_mdwdb.f_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where SRC.sys_class_name in ('CHANGE_REQUEST','PROBLEM','CHANGE_TASK','PROBLEM_TASK','em_ci_severity_task','FACILITIES','HR_CASE',
'KB_SUBMISSION','PM_PROJECT','PM_PROJECT_TASK','RM_DEFECT','sn_customerservice_case','SYSAPPROVAL_GROUP','TASK',
'TICKET','U_ASC_TICKET','U_INCIDENT_TASK','U_PROBLEM_TASK','U_SHIFT_TURNOVER_REPORT','VTB_TASK') and  CASE WHEN (SRC.opened_at is null or SRC.closed_at is null) THEN NULL
	 WHEN TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) < 0 THEN NULL
	  ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) end <>TRGT.OPEN_TO_CLOSE_DURATION