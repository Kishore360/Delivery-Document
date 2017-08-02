SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from molinahealth_mdsdb.task_final SRC
join
molinahealth_mdwdb.f_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join
molinahealth_mdsdb.sc_request_final sc on sc.sys_id=SRC.sys_id and sc.sourceinstance=SRC.sourceinstance 
where   CASE 
		WHEN SRC.sys_class_name ='sc_request' then sc.request_state 
		else 
	SRC.state end <>TRGT.state_src_code