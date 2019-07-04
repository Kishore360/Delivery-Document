SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (

select count(1) as cnt
from  meritsa_mdsdb.task_final s
left  JOIN meritsa_mdwdb.d_task t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  and s.cdctype<>'D'
left join meritsa_mdsdb.sc_request_final dr on s.sys_id=dr.sys_id and s.sourceinstance=dr.sourceinstance
join meritsa_mdwdb.d_lov l on
COALESCE(CONCAT('APPROVAL','~','TASK','~','~','~',upper(s.approval )),'UNSPECIFIED') = l.row_id and t.source_id=l.source_id
 WHERE s.sys_class_name in ('CHANGE_REQUEST','PROBLEM','CHANGE_TASK','PROBLEM_TASK','em_ci_severity_task','FACILITIES','HR_CASE',
'KB_SUBMISSION','PM_PROJECT','PM_PROJECT_TASK','RM_DEFECT','sn_customerservice_case','SYSAPPROVAL_GROUP','TASK',
'TICKET','U_ASC_TICKET','U_INCIDENT_TASK','U_PROBLEM_TASK','U_SHIFT_TURNOVER_REPORT','VTB_TASK')
and COALESCE(l.row_key,CASE WHEN s.approval IS NULL THEN 0 else '-1' end)<>
 t.approval_src_key 
) temp

