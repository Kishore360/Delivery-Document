SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM (select * from <<tenant>>_mdsdb.problem_task_final where  cdctype<>'D') SRC
 LEFT JOIN <<tenant>>_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
   LEFT JOIN <<tenant>>_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  TIMESTAMPDIFF(second, opened_at, coalesce(SRC.closed_at,SRC.sys_updated_on))<>  (TRGT.open_to_close_duration))temp;

