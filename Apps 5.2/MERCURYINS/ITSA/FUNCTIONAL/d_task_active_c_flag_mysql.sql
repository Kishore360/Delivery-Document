SELECT CASE WHEN a.cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN a.cnt THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from (select count(1) as cnt
from mercuryins_mdsdb.task_final SRC
join
 mercuryins_mdwdb.d_task TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where 
SRC.sys_class_name in ('TICKET','INCIDENT','PROBLEM','PROBLEM_TASK','SC_REQ_ITEM','SC_TASK','SC_REQUEST','CHANGE_REQUEST'
,'CHANGE_TASK','U_INCIDENT_TASK',
'KB_SUBMISSION','U_SHIFT_TURNOVER_REPORT','HR_CASE','U_PROBLEM_TASK','U_ASC_TICKET','PM_PROJECT','SYSAPPROVAL_GROUP'
,'VTB_TASK','RM_DEFECT','FACILITIES','TASK') and
 case when SRC.active = TRUE then 'Y' else 'N' end  <>TRGT.active_c_flag )a