


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdwdb.f_request_task stg
 JOIN nbcu_mdsdb.sc_task_final src ON stg.row_id = src.sys_id AND stg.source_id = src.sourceinstance
where src.sys_mod_count<>stg.update_count_c