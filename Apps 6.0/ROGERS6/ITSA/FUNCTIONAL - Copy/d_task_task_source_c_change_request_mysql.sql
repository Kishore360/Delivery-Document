SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task.task_source_c' ELSE 'SUCCESS' END as Message 
-- select coalesce(d1.dimension_name,'UNSPECIFIED') ,d.task_source_c 
FROM rogers_mdwdb.d_task d 
join rogers_mdwdb.f_change_request f on d.row_id=f.row_id and d.source_id=f.source_id
 JOIN rogers_mdwdb.d_lov d1 on f.type_src_key=d1.row_key
 where coalesce(d1.dimension_name,'UNSPECIFIED') <>d.task_source_c
 and d.soft_deleted_flag='N' and f.soft_deleted_flag='N' and d1.soft_deleted_flag='N';