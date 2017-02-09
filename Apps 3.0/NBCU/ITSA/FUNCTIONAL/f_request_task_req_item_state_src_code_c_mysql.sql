SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.state_src_code' ELSE 'SUCCESS' END as Message
FROM nbcu_mdsdb.sc_task_final SRC 
LEFT join nbcu_mdsdb.sc_req_item_final ri ON (ri.sys_id=SRC.request_item  and ri.sourceinstance=SRC.sourceinstance)
LEFT JOIN nbcu_mdwdb.f_request_task TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( ri.state,'UNSPECIFIED')<> (TRGT.req_item_state_src_code_c) 
 