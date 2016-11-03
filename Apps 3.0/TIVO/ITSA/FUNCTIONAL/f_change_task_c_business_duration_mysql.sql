

 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
     FROM tivo_mdsdb.change_task_final i
  join tivo_mdwdb.f_change_task_c f on sys_id=f.row_id and sourceinstance=source_id
 where f.business_duration<>TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',i.business_duration)
 
 