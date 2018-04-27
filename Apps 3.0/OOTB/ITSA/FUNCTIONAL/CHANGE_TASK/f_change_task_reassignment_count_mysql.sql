SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.reassignment_count' ELSE 'SUCCESS' END as Message
 from
<<tenant>>_mdwdb.f_change_task f join 
	  (select change_task_key, count(1) as reassignment_count
		from <<tenant>>_mdwdb.f_change_task_activity 
		where task_attribute_wh_name='assignment_group' and task_attribute_wh_old_value is not NULL 
		group by change_task_key) fa
	on f.change_task_key = fa.change_task_key
where f.reassignment_count <> COALESCE(fa.reassignment_count,0);