SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdwdb.f_request_task stg
 JOIN nbcu_mdsdb.sc_task_final src ON stg.row_id = src.sys_id AND stg.source_id = src.sourceinstance
join nbcu_mdsdb.sc_req_item_final ri on ri.sys_id=src.request_item  and ri.sourceinstance=src.sourceinstance
where COALESCE(ri.state ,'UNSPECIFIED')<>stg.req_item_state_src_code_c