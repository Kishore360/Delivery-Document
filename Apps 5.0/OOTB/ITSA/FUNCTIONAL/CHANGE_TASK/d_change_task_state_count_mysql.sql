	
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.state_count' ELSE 'SUCCESS' END as Message
 from
tjx_mdwdb.d_change_task f 
left join tjx_mdwdb.f_change_task d on (d.row_id = f.row_id and d.source_id = f.source_id)
	left join  (select change_task_key, count(1) as state_count
		from tjx_mdwdb.f_change_task_activity 
		where task_attribute_wh_name='state' and task_attribute_wh_old_value is not NULL 
		group by change_task_key) fa
	on d.change_task_key = fa.change_task_key
    where COALESCE(f.state_count,0) <> COALESCE(fa.state_count,0);
    
    