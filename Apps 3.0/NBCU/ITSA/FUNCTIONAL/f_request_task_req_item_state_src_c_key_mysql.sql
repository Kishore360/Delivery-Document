


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdwdb.f_request_task stg
 JOIN nbcu_mdsdb.sc_task_final src ON stg.row_id = src.sys_id AND stg.source_id = src.sourceinstance
join nbcu_mdsdb.sc_req_item_final ri on ri.sys_id=src.request_item  and ri.sourceinstance=src.sourceinstance
join nbcu_mdwdb.d_lov lkp
on COALESCE(CONCAT('STATE','~','SC_REQ_ITEM','~','~','~',UPPER(ri.state)),'UNSPECIFIED') = lkp.row_id
where COALESCE(lkp.row_key,case when ri.state is null then 0 else -1 end)<>stg.req_item_state_src_c_key