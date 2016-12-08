
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdwdb.f_change_request a
JOIN nbcu_mdsdb.change_request_final b ON a.row_id=b.sys_id
join
nbcu_mdwdb.d_task c
on COALESCE(b.sys_id,'UNSPECIFIED') = c.row_id
 where coalesce(c.row_key,case when b.sys_id is null then 0 else -1 end)<>a.parent_task_c_key