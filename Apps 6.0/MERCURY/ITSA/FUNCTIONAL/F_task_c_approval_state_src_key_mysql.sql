SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  mercury_mdsdb.task_final s
left  JOIN mercury_mdwdb.f_task_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  and s.cdctype<>'D'
join mercury_mdwdb.d_lov l
 CASE 
		WHEN s.sys_class_name ='INCIDENT' THEN COALESCE( CONCAT('Approval','~','INCIDENT','~','~','~',UPPER(s.Approval)),'UNSPECIFIED')
		WHEN s.sys_class_name ='PROBLEM' THEN COALESCE( CONCAT('Approval','~','PROBLEM','~','~','~',UPPER(s.Approval)),'UNSPECIFIED')
		WHEN s.sys_class_name ='PROBLEM_TASK' THEN COALESCE( CONCAT('Approval','~','PROBLEM_TASK','~','~','~',UPPER(s.Approval)),'UNSPECIFIED')
		WHEN s.sys_class_name ='SC_REQ_ITEM' THEN COALESCE( CONCAT('Approval','~','SC_REQ_ITEM','~','~','~',UPPER(s.Approval)),'UNSPECIFIED')
		WHEN s.sys_class_name ='SC_TASK' THEN COALESCE( CONCAT('Approval','~','SC_TASK','~','~','~',UPPER(s.Approval)),'UNSPECIFIED')
		WHEN s.sys_class_name ='SC_REQUEST' THEN COALESCE( CONCAT('Approval','~','SC_REQUEST','~','~','~',UPPER(sc_request.request_Approval)),'UNSPECIFIED')
		WHEN s.sys_class_name ='CHANGE_REQUEST' THEN COALESCE( CONCAT('Approval','~','CHANGE_REQUEST','~','~','~',UPPER(s.Approval)),'UNSPECIFIED')
		WHEN s.sys_class_name ='CHANGE_TASK' THEN COALESCE( CONCAT('Approval','~','CHANGE_TASK','~','~','~',UPPER(s.Approval)),'UNSPECIFIED')
		WHEN s.sys_class_name ='U_INCIDENT_TASK' THEN COALESCE( CONCAT('Approval',
                '~',
                'U_INCIDENT_TASK',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='KB_SUBMISSION' THEN COALESCE( CONCAT('Approval',
                '~',
                'TASK',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='U_SHIFT_TURNOVER_REPORT' THEN COALESCE( CONCAT('Approval',
                '~',
                'U_SHIFT_TURNOVER_REPORT',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='HR_CASE' THEN COALESCE( CONCAT('Approval',
                '~',
                'HR_CASE',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='U_PROBLEM_TASK' THEN COALESCE( CONCAT('Approval',
                '~',
                'U_PROBLEM_TASK',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='U_ASC_TICKET' THEN COALESCE( CONCAT('Approval',
                '~',
                'U_ASC_TICKET',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='PM_PROJECT' THEN COALESCE( CONCAT('Approval',
                '~',
                'PM_PROJECT',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='SYSAPPROVAL_GROUP' THEN COALESCE( CONCAT('Approval',
                '~',
                'TASK',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='VTB_TASK' THEN COALESCE( CONCAT('Approval',
                '~',
                'VTB_TASK',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='RM_DEFECT' THEN COALESCE( CONCAT('Approval',
                '~',
                'RM_DEFECT',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='FACILITIES' THEN COALESCE( CONCAT('Approval',
                '~',
                'TASK',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='TASK' THEN COALESCE( CONCAT('Approval',
                '~',
                'TASK',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')   
                WHEN s.sys_class_name ='TICKET' THEN COALESCE( CONCAT('Approval',
                '~',
                'TICKET',
                '~',
                '~',
                '~',
                UPPER(s.Approval)),
                'UNSPECIFIED')
		
		
	END= l.row_id and TRGT.source_id=l.source_id

 
WHERE s.sys_class_name in ('TICKET','INCIDENT','PROBLEM','PROBLEM_TASK','SC_REQ_ITEM','SC_TASK',
'SC_REQUEST','CHANGE_REQUEST','CHANGE_TASK','U_INCIDENT_TASK',
'KB_SUBMISSION','U_SHIFT_TURNOVER_REPORT','HR_CASE','U_PROBLEM_TASK','U_ASC_TICKET'
,'PM_PROJECT','SYSAPPROVAL_GROUP','VTB_TASK','RM_DEFECT','FACILITIES','TASK') and COALESCE(l.row_key,CASE WHEN s.approval IS NULL THEN 0 else '-1' end)<>
 t.approval_state_src_key
) temp

