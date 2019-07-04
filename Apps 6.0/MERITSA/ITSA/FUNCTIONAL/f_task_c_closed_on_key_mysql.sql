SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from meritsa_mdsdb.task_final SRC

left join

meritsa_mdwdb.f_task_c TRGT

on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id

join

meritsa_mdwdb.d_calendar_date LKP

on COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.closed_at,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')= LKP.row_id 

join

meritsa_mdwdb.d_lov_map br ON TRGT.state_src_key = br.src_key AND dimension_class = 'STATE~TASK'

where SRC.sys_class_name in ('CHANGE_REQUEST','PROBLEM','CHANGE_TASK','PROBLEM_TASK','em_ci_severity_task','FACILITIES','HR_CASE',
'KB_SUBMISSION','PM_PROJECT','PM_PROJECT_TASK','RM_DEFECT','sn_customerservice_case','SYSAPPROVAL_GROUP','TASK',
'TICKET','U_ASC_TICKET','U_INCIDENT_TASK','U_PROBLEM_TASK','U_SHIFT_TURNOVER_REPORT','VTB_TASK') and 
case when SRC.closed_at is null or  (br.dimension_wh_code !='CLOSED' and SRC.closed_at  is not null) then 0 

when SRC.closed_at is not null and  (br.dimension_wh_code ='CLOSED') then LKP.row_key

else -1 end  <>TRGT.closed_on_key