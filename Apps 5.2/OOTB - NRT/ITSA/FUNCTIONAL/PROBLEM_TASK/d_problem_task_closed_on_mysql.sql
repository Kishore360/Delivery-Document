SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem_task.closed_on' ELSE 'SUCCESS' END as Message  
FROM (SELECT count(1) as CNT 
 FROM (select * from <<tenant>>_mdsdb.problem_task_final where  cdctype<>'D') SRC  
LEFT JOIN <<tenant>>_mdwdb.f_problem_task TRGT 
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
LEFT JOIN <<tenant>>_mdwdb.d_problem_task TRGT1
ON (SRC.sys_id =TRGT1.row_id   AND SRC.sourceinstance= TRGT1.source_id  ) 
  left join <<tenant>>_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (src.cdctime<=f1.lastupdated) and  lm.dimension_wh_code = 'CLOSED' 
 and convert_tz(SRC.closed_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>) <> TRGT1.closed_on) temp;
 