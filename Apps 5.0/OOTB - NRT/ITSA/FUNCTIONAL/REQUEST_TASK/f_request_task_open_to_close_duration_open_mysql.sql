SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM (select * from <<tenant>>_mdsdb.sc_task_final where cdctype<>'D') SRC
 LEFT JOIN <<tenant>>_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id)
left join <<tenant>>_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key
where (src.cdctime<=f1.lastupdated) and  TIMESTAMPDIFF(second, SRC.opened_at, SRC.closed_at)<>  TRGT.open_to_close_duration
AND dimension_wh_code = 'CLOSED')temp;
