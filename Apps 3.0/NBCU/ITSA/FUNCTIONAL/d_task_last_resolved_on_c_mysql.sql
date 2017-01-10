
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdwdb.d_task stg
JOIN nbcu_mdsdb.task_final src ON stg.row_id = src.sys_id AND stg.source_id = src.sourceinstance
JOIN nbcu_mdsdb.sc_req_item_final i ON src.sys_id = i.sys_id AND src.sourceinstance = i.sourceinstance
where CONVERT_TZ(coalesce(i.u_fulfilled_at,i.closed_at),'GMT','America/New_York') <>stg.last_resolved_on_c