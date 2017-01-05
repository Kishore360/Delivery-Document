SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

nbcu_mdsdb.task_final a
join nbcu_mdwdb.f_task_c d
on a.sys_id=d.row_id and a.sourceinstance=d.source_id
where CASE 
		WHEN a.sys_class_name ='sc_request' then sc.request_state 
		else 
	a.state end as STATE_SRC_CODE<>f.STATE_SRC_CODE or 
	a.priority <> PRIORITY_SRC_CODE or 
	a.number <> task_number or 
	 a.sys_class_name <> task_type or
	 a.contact_type <> CONTACT_TYPE_SRC_CODE_C
	 
	 