
 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
      FROM tivo_mdsdb.change_task_final i
 join tivo_mdwdb.d_internal_organization d on 
  CONCAT('GROUP~',i.ASSIGNMENT_GROUP) =f.row_id
 join tivo_mdwdb.f_change_task_c f on sys_id=f.row_id and sourceinstance=f.source_id
 where assignment_group_key<>coalesce(d.row_key,case when ASSIGNMENT_GROUP is null then 0 else -1 end)
 
 