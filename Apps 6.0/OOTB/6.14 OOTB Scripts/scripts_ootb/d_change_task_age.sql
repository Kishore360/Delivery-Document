select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.age' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.d_change_task d
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_task f
 on d.row_key = f.change_task_key and d.source_id = f.source_id
where coalesce(d.age ,'')<>coalesce(floor(f.age/86400) ,'')
and d.row_key not in (0,-1);