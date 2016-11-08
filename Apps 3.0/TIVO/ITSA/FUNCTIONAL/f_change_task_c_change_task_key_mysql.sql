
  
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
   FROM tivo_mdsdb.change_task_final i
join tivo_mdwdb.f_change_task_c f on i.sys_id=f.row_id and i.sourceinstance=f.source_id
left join  tivo_mdwdb.d_change_task_c d on i.sys_id =d.row_id and i.sourceinstance=d.source_id
 where f.change_task_key<>coalesce(d.row_key,case when i.sys_id is null then 0 else -1 end)

 
 
 