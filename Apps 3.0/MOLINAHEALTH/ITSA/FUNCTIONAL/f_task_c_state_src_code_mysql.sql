SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_c.state_src_code' ELSE 'SUCCESS' END as Message
from molinahealth_mdsdb.task_final SRC
join
molinahealth_mdwdb.f_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join
 molinahealth_mdsdb.sc_req_item_final sc on sc.sys_id=SRC.sys_id and sc.sourceinstance=SRC.sourceinstance 
where    SRC.state 
	 <>TRGT.state_src_code