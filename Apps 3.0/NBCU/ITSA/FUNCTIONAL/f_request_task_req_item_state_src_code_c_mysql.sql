<<<<<<< HEAD
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdwdb.f_request_task stg
 JOIN nbcu_mdsdb.sc_task_final src ON stg.row_id = src.sys_id AND stg.source_id = src.sourceinstance
join nbcu_mdsdb.sc_req_item_final ri on ri.sys_id=src.request_item  and ri.sourceinstance=src.sourceinstance
where COALESCE(ri.state ,'UNSPECIFIED')<>stg.req_item_state_src_code_c
=======


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.state_src_code' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdsdb.sc_task_final SRC 
 left join nbcu_mdsdb.sc_req_item_final ri on ri.sys_id=SRC.request_item 
 and ri.sourceinstance=SRC.sourceinstance
 LEFT JOIN nbcu_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.state,'')<> (TRGT.req_item_state_src_code_c) 

 
 
 
 

	
	 
>>>>>>> aaa1643d087f22d304cecb7a9e916801886b10e5
