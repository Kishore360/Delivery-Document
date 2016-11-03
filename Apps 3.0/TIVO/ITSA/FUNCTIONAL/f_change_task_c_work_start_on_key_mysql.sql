 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM tivo_mdsdb.change_task_final i
 join tivo_mdwdb.d_calendar_date d on 
   COALESCE(DATE_FORMAT(CONVERT_TZ(i.WORK_start,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED') 
   =d.row_id
 join tivo_mdwdb.f_change_task_c f on sys_id=f.row_id and sourceinstance=f.source_id
 where f.work_start_on_key<>coalesce(d.row_key,case when WORK_start is null then 0 else -1 end)
 
 