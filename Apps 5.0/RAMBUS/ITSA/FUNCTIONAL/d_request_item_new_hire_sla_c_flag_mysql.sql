SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request_item.new_hire_sla_c_flag' ELSE 'SUCCESS' END as Message from
(select count(1) cnt   
FROM rambus_mdwdb.d_request_item d 
INNER JOIN ( SELECT f.request_item_key,f.source_id,f.outcome_flag 
FROM  rambus_mdwdb.f_task_sla f INNER JOIN ( SELECT request_item_key,source_id,MAX(end_on_key) AS end_on_key FROM  rambus_mdwdb.f_task_sla WHERE task_type = 'SC_REQ_ITEM' GROUP BY 1,2 ) t 
ON t.request_item_key=f.request_item_key AND t.source_id=f.source_id AND t.end_on_key=f.end_on_key
 WHERE sla_key IN (SELECT row_key FROM rambus_mdwdb.d_task_sla WHERE sla_name like '%Onboarding%New Hire SLA%') AND task_type ='SC_REQ_ITEM' ) t 
 ON d.row_key=t.request_item_key AND d.source_id=t.source_id 
WHERE d.new_hire_sla_c_flag <> t.outcome_flag)a;