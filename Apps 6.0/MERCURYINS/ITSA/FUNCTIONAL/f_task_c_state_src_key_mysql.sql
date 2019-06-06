select CASE WHEN a.cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN a.cnt >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from 
(SELECT count(1) as cnt
from mercuryins_mdsdb.task_final SRC
 LEFT OUTER JOIN mercuryins_mdsdb.sc_request_final sc_request 
                ON SRC.sys_id = sc_request.sys_id 
                AND SRC.sourceinstance = sc_request.sourceinstance  
join mercuryins_mdwdb.f_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join mercuryins_mdwdb.d_lov LKP
on CASE 
		WHEN SRC.sys_class_name ='INCIDENT' THEN COALESCE( CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='PROBLEM' THEN COALESCE( CONCAT('STATE','~','PROBLEM','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='PROBLEM_TASK' THEN COALESCE( CONCAT('STATE','~','PROBLEM_TASK','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='SC_REQ_ITEM' THEN COALESCE( CONCAT('STATE','~','SC_REQ_ITEM','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='SC_TASK' THEN COALESCE( CONCAT('STATE','~','SC_TASK','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='SC_REQUEST' THEN COALESCE( CONCAT('REQUEST_STATE','~','SC_REQUEST','~','~','~',UPPER(sc_request.request_state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='CHANGE_REQUEST' THEN COALESCE( CONCAT('STATE','~','CHANGE_REQUEST','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='CHANGE_TASK' THEN COALESCE( CONCAT('STATE','~','CHANGE_TASK','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='U_INCIDENT_TASK' THEN COALESCE( CONCAT('STATE',
                '~',
                'U_INCIDENT_TASK',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='KB_SUBMISSION' THEN COALESCE( CONCAT('STATE',
                '~',
                'TASK',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='U_SHIFT_TURNOVER_REPORT' THEN COALESCE( CONCAT('STATE',
                '~',
                'U_SHIFT_TURNOVER_REPORT',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='HR_CASE' THEN COALESCE( CONCAT('STATE',
                '~',
                'HR_CASE',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='U_PROBLEM_TASK' THEN COALESCE( CONCAT('STATE',
                '~',
                'U_PROBLEM_TASK',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='U_ASC_TICKET' THEN COALESCE( CONCAT('STATE',
                '~',
                'U_ASC_TICKET',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='PM_PROJECT' THEN COALESCE( CONCAT('STATE',
                '~',
                'PM_PROJECT',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='SYSAPPROVAL_GROUP' THEN COALESCE( CONCAT('STATE',
                '~',
                'TASK',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='VTB_TASK' THEN COALESCE( CONCAT('STATE',
                '~',
                'VTB_TASK',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='RM_DEFECT' THEN COALESCE( CONCAT('STATE',
                '~',
                'RM_DEFECT',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='FACILITIES' THEN COALESCE( CONCAT('STATE',
                '~',
                'TASK',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='TASK' THEN COALESCE( CONCAT('STATE',
                '~',
                'TASK',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')   
                WHEN SRC.sys_class_name ='TICKET' THEN COALESCE( CONCAT('STATE',
                '~',
                'TICKET',
                '~',
                '~',
                '~',
                UPPER(SRC.state)),
                'UNSPECIFIED')
		
		
	END= LKP.row_id and TRGT.source_id=LKP.source_id

WHERE 
SRC.sys_class_name in ('TICKET','INCIDENT','PROBLEM','PROBLEM_TASK','SC_REQ_ITEM','SC_TASK',
'SC_REQUEST','CHANGE_REQUEST','CHANGE_TASK','U_INCIDENT_TASK',
'KB_SUBMISSION','U_SHIFT_TURNOVER_REPORT','HR_CASE','U_PROBLEM_TASK','U_ASC_TICKET'
,'PM_PROJECT','SYSAPPROVAL_GROUP','VTB_TASK','RM_DEFECT','FACILITIES','TASK') and
 coalesce(LKP.row_key,case when SRC.state is null then 0 else -1 end)<>TRGT.state_src_key)a


