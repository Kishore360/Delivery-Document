SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from mercury_mdsdb.task_final SRC
join
mercury_mdwdb.f_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join
mercury_mdwdb.d_internal_contact LKP
on COALESCE(concat('INTERNAL_CONTACT~',SRC.closed_by),'UNSPECIFIED')= LKP.row_id and TRGT.source_id=LKP.source_id
where SRC.sys_class_name in ('CHANGE_REQUEST','PROBLEM','CHANGE_TASK','PROBLEM_TASK','em_ci_severity_task','FACILITIES','HR_CASE',
'KB_SUBMISSION','PM_PROJECT','PM_PROJECT_TASK','RM_DEFECT','sn_customerservice_case','SYSAPPROVAL_GROUP','TASK',
'TICKET','U_ASC_TICKET','U_INCIDENT_TASK','U_PROBLEM_TASK','U_SHIFT_TURNOVER_REPORT','VTB_TASK') and coalesce(LKP.row_key,case when SRC.closed_by is null then 0 else -1 end)<>TRGT.closed_by_key