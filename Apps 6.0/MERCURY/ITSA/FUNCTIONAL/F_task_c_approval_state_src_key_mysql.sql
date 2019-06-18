SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  mercury_mdsdb.task_final s
left  JOIN mercury_mdwdb.f_task_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  and s.cdctype<>'D'
left join mercury_mdsdb.sc_request_final dr on s.sys_id=dr.sys_id
join mercury_mdwdb.d_lov l on
 CASE    WHEN s.sys_class_name ='SC_REQ_ITEM' THEN COALESCE( CONCAT('APPROVAL','~','SC_REQ_ITEM','~',UPPER(s.approval)),'UNSPECIFIED')   WHEN s.sys_class_name ='SC_REQUEST' THEN COALESCE( CONCAT('APPROVAL','~','SC_REQUEST','~',UPPER(s.approval)),'UNSPECIFIED')   WHEN s.sys_class_name ='CHANGE_REQUEST' THEN COALESCE( CONCAT('APPROVAL','~','CHANGE_REQUEST','~',UPPER(s.approval)),'UNSPECIFIED')   ELSE COALESCE( CONCAT('APPROVAL','~','TASK','~',UPPER(s.approval)),'UNSPECIFIED')  END= l.row_id and t.source_id=l.source_id

 
WHERE s.sys_class_name in ('TICKET','INCIDENT','PROBLEM','PROBLEM_TASK','SC_REQ_ITEM','SC_TASK',
'SC_REQUEST','CHANGE_REQUEST','CHANGE_TASK','U_INCIDENT_TASK',
'KB_SUBMISSION','U_SHIFT_TURNOVER_REPORT','HR_CASE','U_PROBLEM_TASK','U_ASC_TICKET'
,'PM_PROJECT','SYSapproval_GROUP','VTB_TASK','RM_DEFECT','FACILITIES','TASK') and 
COALESCE(l.row_key,CASE WHEN s.approval IS NULL THEN 0 else '-1' end)<>
 t.approval_state_src_key
) temp

