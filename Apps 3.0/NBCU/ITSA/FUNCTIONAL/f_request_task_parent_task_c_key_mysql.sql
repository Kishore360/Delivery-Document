


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.parent_task_c_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdwdb.f_request_task stg
 JOIN nbcu_mdsdb.sc_task_final src ON stg.row_id = src.sys_id AND stg.source_id = src.sourceinstance
join nbcu_mdsdb.sc_req_item_final ri on ri.sys_id=src.request_item  and ri.sourceinstance=src.sourceinstance
join nbcu_mdwdb.d_task lkp
on COALESCE(src.parent,'UNSPECIFIED')=lkp.row_id
where COALESCE(lkp.row_key,case when src.parent is null then 0 else -1 end)<>stg.parent_task_c_key