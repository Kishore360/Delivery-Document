SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from mercuryins_mdsdb.task_final SRC
join
mercuryins_mdwdb.f_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join
mercuryins_mdsdb.sc_request_final sc 
on sc.sys_id=SRC.sys_id and sc.sourceinstance=SRC.sourceinstance 
join
mercuryins_mdwdb.d_lov LKP
on CASE 
		WHEN SRC.sys_class_name ='INCIDENT' THEN COALESCE( CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='PROBLEM' THEN COALESCE( CONCAT('STATE','~','PROBLEM','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='PROBLEM_TASK' THEN COALESCE( CONCAT('STATE','~','PROBLEM_TASK','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='SC_REQ_ITEM' THEN COALESCE( CONCAT('STATE','~','SC_REQ_ITEM','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='SC_TASK' THEN COALESCE( CONCAT('STATE','~','SC_TASK','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='SC_REQUEST' THEN COALESCE( CONCAT('REQUEST_STATE','~','SC_REQUEST','~','~','~',UPPER(sc.request_state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='CHANGE_REQUEST' THEN COALESCE( CONCAT('STATE','~','CHANGE_REQUEST','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')
		WHEN SRC.sys_class_name ='CHANGE_TASK' THEN COALESCE( CONCAT('STATE','~','CHANGE_TASK','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')

	END= LKP.row_id and TRGT.source_id=LKP.source_id
where coalesce(LKP.row_key,case when SRC.state is null then 0 else -1 end<>TRGT.state_src_key