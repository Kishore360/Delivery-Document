SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_sr_task_c.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM pan6_mdsdb.u_stask_final SRC
  JOIN pan6_mdwdb.f_sr_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 join pan6_mdwdb.d_sr_task_c b
on SRC.sys_id=b.row_id and SRC.sourceinstance=b.source_id
 LEFT JOIN pan6_mdwdb.d_lov_map br 
 ON b.state_src_key = br.src_key
WHERE br.dimension_wh_code IN ('CLOSED','RESOLVED')
AND case when b.opened_on> b.changed_on then null else  TIMESTAMPDIFF(SECOND,b.opened_on,b.changed_on) end <> TRGT.open_to_close_duration;






